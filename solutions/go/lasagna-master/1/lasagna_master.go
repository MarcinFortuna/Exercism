package lasagna

func PreparationTime(layers []string, avgTime int) int {
    if avgTime == 0 {
        avgTime = 2
    }
    return len(layers) * avgTime
}

func Quantities(layers []string) (int, float64) {
    noodles := 0
    sauce := 0.0
	for _, layer := range layers {
        if layer == "sauce" {
            sauce += 0.2
        } else if layer == "noodles" {
            noodles += 50
        }
    }
    return noodles, sauce
}

func AddSecretIngredient(friendsList, myList []string) {
    myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
    var out []float64
    for _, el := range quantities {
        out = append(out, float64(portions) * 0.5 * el)
    }
    return out
}