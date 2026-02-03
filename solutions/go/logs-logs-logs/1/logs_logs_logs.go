package logs
import "fmt"
import "unicode/utf8"

// Application identifies the application emitting the given log.
func Application(log string) string {
    for _, r := range log {
        code := fmt.Sprintf("%U", r)
        if code == "U+2757" {
            return "recommendation"
        }
        if code == "U+1F50D" {
            return "search"
        }
        if code == "U+2600" {
            return "weather"
        }
    }
    return "default"
}

// Replace replaces all occurrences of old with new, returning the modified log
// to the caller.
func Replace(log string, oldRune, newRune rune) string {
	output := ""
    stringifiedOld := string(oldRune)
    stringifiedNew := string(newRune)
    for _, r := range log {
        stringified := string(r)
        if stringified == stringifiedOld {
            output += stringifiedNew
        } else {
            output += stringified
        }
    }
    return output
}

// WithinLimit determines whether or not the number of characters in log is
// within the limit.
func WithinLimit(log string, limit int) bool {
	return utf8.RuneCountInString(log) <= limit
}
