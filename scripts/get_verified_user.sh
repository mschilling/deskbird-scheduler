    #!/bin/bash

    DESKBIRD_API_URL=https://api.deskbird.com/v1.1

    get_verified_user() {
        local user_access_token=$1

        # response=$(curl -s -H "Authorization: Bearer $user_access_token" "$DESKBIRD_API_URL/user")
        # if [[ $? -ne 0 ]]; then
        #     echo "API call failed"
        #     return 1
        # fi

        # if [[ $(echo "$response" | jq -r '.status') == "401" ]]; then
        #     echo "Trying again"

            # Refresh token
            refresh_access_token "$user_access_token"

            echo $DESKBIRD_ACCESS_TOKEN

            # Retry the call
            response=$(curl -s -H "Authorization: Bearer $user_access_token" "$DESKBIRD_API_URL/user")
            if [[ $? -ne 0 ]]; then
                echo "API call failed after token refresh"
                return 1
            fi
        # fi

        echo "$response" | jq '.'
    }

    refresh_access_token() {
        local user_access_token=$1
        # Implement the logic to refresh the access token here
        source ./scripts/update_refresh-token.sh
        echo "Refreshing access token for $user_access_token"
    }

    # Example usage
    echo "Getting verified user"
    user_access_token="$DESKBIRD_ACCESS_TOKEN"
    get_verified_user "$user_access_token"