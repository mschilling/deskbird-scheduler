# Project: Deskbird Scheduler

## Project Overview

This is a TypeScript-based Node.js project designed to automate office desk bookings through the Deskbird API. The application is configured to run as a scheduled task (e.g., a cron job) to book a desk six days in advance. It handles authentication by refreshing tokens using a Google API and manages timezone calculations to ensure accurate booking times.

The main technologies used are:
- **Node.js** as the runtime environment.
- **TypeScript** for static typing and modern JavaScript features.
- **`ts-node`** for running TypeScript directly without pre-compilation during development.
- **`luxon`** for handling dates and times, specifically for timezone-aware operations.
- **`dotenv-flow`** for managing environment variables across different environments (e.g., development, production).

The project is structured with a main entry point in `src/main.ts` and utility functions organized in the `src/utils` directory.

## Building and Running

### Prerequisites
- Node.js (version 22, as specified in `package.json`)
- npm

### Installation
1.  Install dependencies:
    ```sh
    npm install
    ```

2.  Create a `.env` file in the root directory with the following variables:
    ```
    REFRESH_TOKEN=your_deskbird_refresh_token
    GOOGLE_API_KEY=your_google_api_key
    DESKBIRD_RESOURCE_ID=your_deskbird_resource_id
    DESKBIRD_ZONE_ITEM_ID=your_deskbird_zone_item_id
    DESKBIRD_WORKSPACE_ID=your_deskbird_workspace_id
    ```

### Commands

*   **Run the application (development):**
    ```sh
    npm run start
    ```
    This command uses `ts-node` to execute the main script.

*   **Build for production:**
    ```sh
    npm run build
    ```
    This command uses the TypeScript compiler (`tsc`) to transpile the code into JavaScript in the `dist` directory, as configured in `tsconfig.json`.

*   **Format code:**
    ```sh
    npm run format
    ```
    This command uses `prettier` to format the entire codebase.

## Development Conventions

*   **Code Style:** The project uses Prettier for automated code formatting. Adhere to the existing style.
*   **Modularity:** New functionality should be placed in separate files within the `src/utils` directory to maintain a clean and organized structure.
*   **Environment Variables:** All secrets and configuration variables must be managed through `.env` files and accessed via `process.env`. Do not hardcode sensitive information.
*   **Error Handling:** The application is designed to exit with a non-zero status code (`process.exit(1)`) if any part of the booking process fails, which is useful for cron job monitoring.
