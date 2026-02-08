package parsinglogfiles
import "regexp"

func IsValidLine(text string) bool {
	re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
    return re.MatchString(text)
}

func SplitLogLine(text string) []string {
	re := regexp.MustCompile(`<[\*\-=~]*>`)
    return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	counter := 0
    re := regexp.MustCompile(`(?i)".*?password.*?"`)
    for _, line := range lines {
        if re.MatchString(line) {
            counter++
        }
    }
	return counter
}

func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line\d+`)
    return re.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	re := regexp.MustCompile(`User\s+(\S+)`)
    newLines := make([]string, 0)
    for _, line := range lines {
        match := re.FindStringSubmatch(line)
        if match != nil {
         	usrnm := match[1]
            newLine := "[USR] " + usrnm + " " + line
            newLines = append(newLines, newLine)
        } else {
            newLines = append(newLines, line)
        }
    }
    return newLines
}
