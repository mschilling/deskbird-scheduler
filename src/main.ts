import * as dotenvFlow from "dotenv-flow";
dotenvFlow.config();

import { DESK_56, DESK_58 } from "./constants";
import { createBooking } from "./utils/create-booking";
import { getNewAccessToken } from "./utils/get-new-access-token";
import { getNextBookingDate } from "./utils/date/get-next-booking-date";


// Main function
async function run() {
  const refreshToken = process.env.REFRESH_TOKEN;

  if (!refreshToken) {
    console.error("DESKBIRD_ACCESS_TOKEN is not set");
    return;
  }

  const accessToken = await getNewAccessToken(refreshToken);
  if (!accessToken) {
    console.error("accessToken is not set");
    return;
  }

  const bookingDate = getNextBookingDate(6);

  console.log(bookingDate)

  const myDesk  = DESK_58;
  const startTime = new Date(bookingDate).setHours(7, 0, 0, 0);
  const endTime = new Date(bookingDate).setHours(18, 0, 0, 0);

  const data = {
    bookings: [
      {
        bookingStartTime: startTime,
        bookingEndTime: endTime,
        isAnonymous: false,
        resourceId: "70645",
        zoneItemId: myDesk,
        workspaceId: "6817",
      },
    ],
  };

  try {
    const response = await createBooking(data, accessToken);
    const successfulBookings = response.successfulBookings.length;
    const failedBookings = response.failedBookings.length;

    console.log(`SuccessfulBookings: ${successfulBookings}`);
    console.log(`FailedBookings: ${failedBookings}`);
    if(failedBookings > 0) {
      console.dir(response.failedBookings, { depth: null });
    }
  } catch (error) {
    console.error("Failed to run the booking process:", error);
  }
}

// Run the main function
run().catch(console.error);
