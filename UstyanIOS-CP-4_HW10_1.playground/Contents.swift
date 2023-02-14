import UIKit

//task1
public class Doctor {
    var name: String
    var scheduleTime = "9:00-12:00"
    var workSchedule: String {
        get {
            return "График работы \(scheduleTime)"
        }
    }
    var bookedTime : [String] = []
    
    var bookSchedule : String {
        get {
            if bookedTime.isEmpty {
                return "Нет забронированного времени"
            } else {
                return "Забронированное время врача \(bookedTime)"
            }
        }
        set {
            bookedTime.append(newValue)
            print("Вы забронировали время \(newValue)")
        }
    }
    init(name:String){
        self.name = name
    }
    
    //    приватный метод
    private func tellTheDiagnosis(){
        print("Ваш диагноз ковид")
    }
    
    //    публичный метод
    public func speakAtConference(){
        print("\(name) выступит на конференции \"Синий трактор\" и расскажет о влиянии Бубы на Карамельку")
    }
    
}
var doctor1 = Doctor(name: "Иван Петров")
print(doctor1.workSchedule)
print(doctor1.bookSchedule)
doctor1.bookSchedule = "9:00-10:00"
print(doctor1.bookSchedule)
doctor1.bookSchedule = "10:00-11:00"
print(doctor1.bookSchedule)

doctor1.speakAtConference()

//task2
class Phone {
    func showNotes(id: Int) -> String {
        return "Заметка 1: Коржику 7 лет"
    }
    func showNotes(name: String) -> String {
        return "Заметка 1: Коржику 7 лет"
    }
    func showNotes(id: [Int]) -> String {
        return "Заметка 1: Коржику 7 лет"
    }
}
var iphone = Phone()

iphone.showNotes(id: 1)
iphone.showNotes(name: "Заметка 1")
iphone.showNotes(id: [1])

//task3
print("----")

class Human {
    func smile() -> String {
        return "Веселая улыбка"
    }
}

class Student: Human {
    override func  smile() -> String {
        return super.smile() + " студента"
    }
}

var human = Human()
var student = Student()

print(human.smile())
print(student.smile())

