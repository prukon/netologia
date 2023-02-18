import UIKit

enum Currency {
    case rouble (counrty: String, shortName: String)
    case dollar (counrty: String, shortName: String)
    case euro (counrty: String, shortName: String)
}
var roble = Currency.rouble(counrty: "Russia", shortName: "RUB")
print(roble)


 class Doctor {
    var firstName: String
    var lastName: String
    var fieldOfStudy: String
    var numberOfOperations: Int
     
     func makeOperation(){
     }
     func makeDdiagnose(){
     }
    
    init(firstName: String, lastName: String, fieldOfStudy: String, numberOfOperations: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.fieldOfStudy = fieldOfStudy
        self.numberOfOperations  = numberOfOperations
    }
}
var doctor1: Doctor = .init(firstName: "Вася", lastName: "Иванов", fieldOfStudy: "1 степень", numberOfOperations: 23)
print("Доктор \(doctor1.firstName) \(doctor1.lastName) сделал \(doctor1.numberOfOperations) операции")

struct applicantQuestionnaire {
    var firstName: String
    var lastName: String
    var score: Int
    var school: String
}


//Композиция
//Есть класс Дом
//Есть класс Квартира
//При уничтожении класса "Дом" - все экземляры класса "Квартира" будут уничтожены

//Есть класс Страна
//Есть класс СубъектСтраны
//При уничтожении "Страна"  - все экземляры класса "СубьектСтраны" будут уничтожены

//Агрегация
//Есть класс Телефон
//Есть класс Подписки
//При уничтожении класса "Телефон" - все экземляры класса "Подписки" не будут уничтожены

//Агрегация
//Есть класс МандариновоеДерево
//Есть класс Мандарин
//При уничтожении класса "МандариновоеДерево" - все экземляры класса "Мандарин" не будут уничтожены
