import UIKit

//task 1.1
var var1: String? = "Первая переменная"
var var2: String? = "Вторая переменная"
var var3: String? = nil

print(var1 ?? "пустое значение")
print(var2 ?? "пустое значение")
print(var3 ?? "пустое значение")

print("_____")
var3 = "Третья переменная"
print(var1 ?? "пустое значение")
print(var2 ?? "пустое значение")
print(var3 ?? "пустое значение")

//task 1.2
let let1: String = "11"
let let2: String = "22"
let let3: String = "d33"
let let4: String = "44"
let let5: String = "55 кг"
var summOptionalBinding:Int = 0
var summForcedUnwrapping:Int = 0

//optional binding
if var let1:Int = Int(let1) {
    summOptionalBinding += let1
}
if var let2:Int = Int(let2) {
    summOptionalBinding += let2
}
if var let3:Int = Int(let3) {
    summOptionalBinding += let3
}
if var let4:Int = Int(let4) {
    summOptionalBinding += let4
}
if var let5:Int = Int(let5) {
    summOptionalBinding += let5
    
}
print(summOptionalBinding)

//forced unwrapping
if Int(let1) != nil {
    summForcedUnwrapping += Int(let1)!
}
if Int(let2) != nil {
    summForcedUnwrapping += Int(let2)!
}
if Int(let3) != nil {
    summForcedUnwrapping += Int(let3)!
}
if Int(let4) != nil {
    summForcedUnwrapping += Int(let4)!
}
if Int(let5) != nil {
    summForcedUnwrapping += Int(let5)!
}
print(summForcedUnwrapping)

//task 2
let myConst: Int? = Int("9")
if var myConst: Int = myConst{
    if myConst  < -10 {
        print("Меньше -10 градусов")
    }   else if myConst < 0  {
        print("Меньше нуля")
    }    else if myConst > 10 {
        print("Больше 10 градусов")
    }   else if myConst > 0 {
        print("Больше нуля")
    }
}else {
    print("Нет значения")
}
