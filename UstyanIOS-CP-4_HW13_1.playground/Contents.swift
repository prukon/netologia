import UIKit

//task1
var referenceFuelValue = 1800
func calculateFuel(lenght: Int, weight: Int, calc: (Int, Int) -> Int) -> Bool {
    
    print(calc(lenght, weight))
    if calc(lenght, weight) == referenceFuelValue {
        return true
    } else {
        return false
    }
}

//первый инженер
calculateFuel(lenght: 60, weight: 30, calc: { (lenght: Int, weight: Int) -> Int in
    var fuelConsumption = (lenght * weight)
    return fuelConsumption
})

//второй инженер
calculateFuel(lenght: 60, weight: 30, calc: { (lenght: Int, weight: Int) -> Int in
    var fuelConsumption = (lenght * weight)*2
    return fuelConsumption
})

//task2
//сокращеная запись
calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 2}
calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 3}
calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 4}
calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 5}
