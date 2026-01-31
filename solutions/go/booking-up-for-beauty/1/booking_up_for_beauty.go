package booking

import "time"

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	layout := "1/2/2006 15:04:05"
    t, err := time.Parse(layout, date)
    if err != nil {
        panic(err)
    }
    return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
    t, err := time.Parse("January 2, 2006 15:04:05", date)
    if err != nil {
        return false
    }
    return t.Before(time.Now())
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	t, err := time.Parse("Monday, January 2, 2006 15:04:05", date)
    if err != nil {
        panic(err)
    }
    hours, mins, _ := t.Clock()
    return hours >= 12 && (hours < 18 || (hours == 18 && mins == 0))
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	t, err := time.Parse("1/2/2006 15:04:05", date)
    if err != nil {
        panic(err)
    }
    formatted := t.Format("Monday, January 2, 2006, at 15:04.")
    return "You have an appointment on " + formatted
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
    return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
