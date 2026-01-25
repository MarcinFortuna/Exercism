// Package weather returns a weather forecast for a given location.
package weather

var (
    // CurrentCondition: Information about the current weather condition.
	CurrentCondition string
    // CurrentLocation: City for which the forecast will be presented.
	CurrentLocation  string
)

// Forecast: Main function, generates the forecast string.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
