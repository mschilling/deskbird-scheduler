#!/bin/bash

# Load configuration
source ./scripts/get_verified_user.sh

API_BASE_URL="https://api.deskbird.com/v1.1"

# Constants
DESK_58=476809
DESK_56=476804

MY_DESK=$DESK_56

next_start_time() {
    # Date = current date + 6 days
    # Time = 07:00 (in the morning)
    # Get the timestamp in milliseconds
    local start_time=$(date -d "+6 days 07:00" +%s000)
    echo $start_time
}
next_end_time() {
    # Get the current time in milliseconds
    # date = Today + 6 days
    # time = 18:00
    local end_time=$(date -d "+6 days 18:00" +%s000)
    echo $end_time
}

# Function to create a booking
create_booking() {
    local data=$1
    local access_token=$2

    echo $data

    response=$(curl -s -X POST "$API_BASE_URL/bookings" \
        -H "Authorization: Bearer $access_token" \
        -H "Content-Type: application/json" \
        -d "$data")

    echo "$response"
}

# Main function
run() {

    local access_token=$DESKBIRD_ACCESS_TOKEN

    local data=$(
        cat <<EOF
{
    "bookings": [
        {
            "bookingStartTime": $(next_start_time),
            "bookingEndTime": $(next_end_time),
            "isAnonymous": false,
            "resourceId": "70645",
            "zoneItemId": $MY_DESK,
            "workspaceId": "6817"
        }
    ]
}
EOF
    )

    local response=$(create_booking "$data" "$access_token")
    echo "$response"
    local successful_bookings=$(echo "$response" | jq '.successfulBookings | length')
    local failed_bookings=$(echo "$response" | jq '.failedBookings | length')

    echo "SuccessfulBookings: $successful_bookings"
    echo "FailedBookings: $failed_bookings"
}

# Run the main function
run
