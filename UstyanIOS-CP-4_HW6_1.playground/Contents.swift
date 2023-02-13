import UIKit
//task1
var personInfo = (favoriteMovie: "Terminator", favoriteNumber: 2, favoriteFood: "pizza")
var (favoriteMovie, favoriteNumber, favoriteFood) = personInfo
var personInfo2 = (favoriteMovie: "Terminator2", favoriteNumber: 3, favoriteFood: "wok")
var changeInfo = (favoriteMovie:"", favoriteNumber: Int(), favoriteFood: "")
changeInfo = personInfo
personInfo = personInfo2
personInfo2 = changeInfo
var personInfo3 = (personInfo.favoriteNumber, personInfo2.favoriteNumber, personInfo.favoriteNumber - personInfo2.favoriteNumber)
//task2
var diary = ["Tom": ["Математика":"4",
                     "Химия":"5",
                     "Биология":"4"]]
//task3
typealias Chessman = [String: (alpha:Character, num: Int)?]
var Chessmans: Chessman = ["Белый конь":("f", 5),
                           "Черный конь":("d", 6),
                           "Белый слон":nil
]
if let info  = Chessmans["Белый конь"], let value  = info {
    print((value.alpha), value.num)
} else {
    print("figure destroyed")
}
print("__________")

//task4
for (i,j) in Chessmans.enumerated() {
    if let info  = Chessmans[j.key], let value  = info {
        print((value.alpha), value.num)
    } else {
        print("figure destroyed")
    }
}
