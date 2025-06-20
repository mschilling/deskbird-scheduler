# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Deskbird office desk booking automation tool that schedules desk reservations 6 days in advance. The application authenticates with Google Firebase for token refresh and uses the Deskbird API to create bookings.

## Development Commands

- `npm run build` - Compile TypeScript to JavaScript
- `npm run start` - Run the application using ts-node
- `npm run format` - Format code using Prettier

## Architecture

### Core Flow
The main execution flow is in `src/main.ts`:
1. Validates environment variables (refresh tokens, API keys, workspace IDs)
2. Refreshes access token using Google Firebase API
3. Calculates next booking date (6 days from now, Europe/Amsterdam timezone)
4. Creates desk booking from 9 AM to 6 PM (skips weekends)
5. Processes booking response and exits with appropriate status

### Key Components

- **Authentication**: `src/utils/get-new-access-token.ts` handles Firebase token refresh
- **Booking Logic**: `src/utils/create-booking.ts` manages Deskbird API calls
- **Date Handling**: `src/utils/date/get-next-booking-date.ts` calculates booking dates with timezone support
- **Configuration**: `src/constants.ts` centralizes API URLs and environment variable access

### Environment Variables
Required environment variables (configured in `.env`):
- `REFRESH_TOKEN` - Firebase refresh token
- `GOOGLE_API_KEY` - Google API key for Firebase
- `DESKBIRD_RESOURCE_ID` - Specific desk/resource ID
- `DESKBIRD_ZONE_ITEM_ID` - Zone identifier
- `DESKBIRD_WORKSPACE_ID` - Workspace identifier

### Dependencies
- **luxon** - Date/time manipulation with timezone support
- **dotenv-flow** - Environment variable management
- **TypeScript** - Type safety and compilation

## Error Handling
Application exits with status code 1 on any failure (missing tokens, API errors, failed bookings) to support automated scheduling via cron jobs.