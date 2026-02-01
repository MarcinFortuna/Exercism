package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	unitsMap := map[string]int{}
    unitsMap["quarter_of_a_dozen"] = 3
    unitsMap["half_of_a_dozen"] = 6
    unitsMap["dozen"] = 12
    unitsMap["small_gross"] = 120
    unitsMap["gross"] = 144
    unitsMap["great_gross"] = 1728
    return unitsMap
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
    unitVal, unitExists := units[unit]
    if !unitExists {
        return false
    }
    bill[item] += unitVal
    return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	unitVal, unitExists := units[unit]
    itemVal, itemExists := bill[item]
    if !unitExists || !itemExists || unitVal > itemVal {
        return false
    }
    if itemVal == unitVal {
        delete(bill, item)
    } else {
        bill[item] -= unitVal
    }
    return true
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	itemVal, itemExists := bill[item]
    if !itemExists {
        return 0, false
    }
    return itemVal, true
}
