import UIKit
//taks1
var manStudent = ["Bob", "John"]
var womanStudent = ["Helga", "Nastya", "Kate"]
var students = womanStudent
for i in manStudent {
    students.insert(i, at: 0)
}
print(students)
print("_________")

//taks2
students.sort()
print(students)
print("_________")

//task3
var myNumber = [1, 5, -2, -4, 6]
myNumber.sort(by: >)
myNumber = myNumber.filter({ $0 >= 0 })
print(myNumber)
print("_________")

//task4
let myArray = [1, 2, 3, 4, 7, 8, 15]
var resultIndex: Array <Int> = Array()
for (index, i) in myArray.enumerated(){
    for (secondIndex, j) in myArray.enumerated(){
        if i + j == 6 {
            resultIndex.append(index)
            resultIndex.append(secondIndex)
        }
    }
}
resultIndex = Array(Set(resultIndex))
resultIndex.sort()
print(resultIndex)
