import { addDays } from "date-fns";

export function getNextBookingDate(daysFromNow: number = 6): Date {
  return addDays(new Date(), daysFromNow);
}
