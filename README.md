# 🏢 Deskbird Scheduler - Automated Office Desk Booking

Automatically book your office desk 6 days in advance using Deskbird's API. Never miss your preferred desk again with this smart scheduling tool that handles authentication, timezone calculations, and booking management.

## ✨ Features

- **Automated Scheduling**: Books desks 6 days in advance (9 AM - 6 PM)
- **Smart Date Handling**: Skips weekends and handles timezone (Europe/Amsterdam)  
- **Firebase Authentication**: Secure token refresh management
- **Error Handling**: Robust error handling for reliable automation
- **Cron-Ready**: Designed for scheduled execution via cron jobs

## Getting Started

### Prerequisites

- Node.js v22
- npm

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/mschilling/deskbird-scheduler.git
   cd deskbird-scheduler
   ```

2. Install dependencies:

   ```sh
   npm install
   ```

3. Create a `.env` file in the root directory and add your Deskbird refresh token:

   ```sh
   REFRESH_TOKEN=your_deskbird_refresh_token
   GOOGLE_API_KEY=your_google_api_key
   DESKBIRD_RESOURCE_ID=your_deskbird_resource_id
   DESKBIRD_ZONE_ITEM_ID=your_deskbird_zone_item_id
   DESKBIRD_WORKSPACE_ID=your_deskbird_workspace_id

   ```

### Usage

Run the scheduler manually:
```sh
npm run start
```

Or set up automated scheduling with cron:
```sh
# Run every day at 8 AM to book 6 days ahead
0 8 * * * cd /path/to/deskbird-scheduler && npm run start
```

## Contribution Guidelines

### Coding Standards

- Follow the existing code style and structure.
- Use meaningful variable and function names.
- Write comments to explain complex logic.

### Creating Issues

- Before creating an issue, check if it already exists.
- Provide a clear and detailed description of the issue.
- Include steps to reproduce the issue, if applicable.

### Submitting Pull Requests

- Fork the repository and create a new branch for your feature or bugfix.
- Make sure your code follows the coding standards.
- Test your changes thoroughly.
- Submit a pull request with a clear description of your changes.

## License

This project is licensed under the ISC License. See the [LICENSE](LICENSE) file for details.
