package airportrobot

// Write your code here.
// This exercise does not have tests for each individual task.
// Try to solve all the tasks first before running the tests.
type Greeter interface {
    LanguageName() string
    Greet(name string) string 
}

func SayHello(name string, greeterFunction Greeter) string {
    lgNameString := greeterFunction.LanguageName()
    greetString := greeterFunction.Greet(name)
    return "I can speak " + lgNameString + ": " + greetString
}

type Italian struct {}
type Portuguese struct {}

func (g Italian) LanguageName() string {
    return "Italian"
}

func (g Portuguese) LanguageName() string {
    return "Portuguese"
}

func (g Italian) Greet(name string) string {
    return "Ciao " + name + "!"
}

func (g Portuguese) Greet(name string) string {
    return "Olá " + name + "!"
}