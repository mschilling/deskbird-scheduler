#!/bin/bash

DESKBIRD_API_URL=https://api.deskbird.com

# Configuration

API_URL=$GOOGLE_API_URL$GOOGLE_API_KEY

# Request a new access token using the refresh token
response=$(curl -s -X POST $API_URL \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "refresh_token=$REFRESH_TOKEN" \
    -d "grant_type=refresh_token")

# Extract the new access token from the response
access_token=$(echo $response | jq -r '.access_token')

# Check if the access token was successfully retrieved
if [ "$access_token" != "null" ]; then
    echo "Access token successfully created"

    # Assign environment variable DESKBIRD_ACCESS_TOKEN with updated value
    export DESKBIRD_ACCESS_TOKEN=$access_token
else
    echo "Failed to get a new access token"
    echo "Response: $response"
fi
