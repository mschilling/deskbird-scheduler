import { addDays } from "date-fns";

export function getNextBookingDate(daysFromNow: number = 6): Date {
  // set the date to 6 days from now
  const newDate = addDays(new Date(), daysFromNow);

  console.log("newDate", newDate);
  return newDate;
}
