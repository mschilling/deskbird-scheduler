import { addDays, startOfHour } from "date-fns";

export function getNextBookingDate(daysFromNow: number = 6): Date {
  
  return startOfHour(addDays(new Date(), daysFromNow));
//  return startOfHour(addDays(new TZDate(new Date(), "Europe/Amsterdam"), daysFromNow));

}
