import UIKit
//task 1
let january = "Январь",
february = "Февраль",
march = "Март",
april = "Апрель",
may = "Май",
june = "Июнь,",
jule = "Июль",
august = "Август",
september = "Сентябрь",
oсtober = "Октябрь",
november = "Ноябрь",
december = "Декабрь"
var selectedMonth:String,
    holiday = 8,
    workDay:Int

//Выбираем нужный месяц
selectedMonth = january

if selectedMonth == january {
    holiday += 8
    workDay = 31 - holiday
    print("В январе \(workDay) рабочих дн.")
} else if selectedMonth == february {
    holiday += 1
    workDay = 28 - holiday
    print("В феврале \(workDay) рабочих дн.")
} else if selectedMonth == march {
    holiday += 1
    workDay = 31 - holiday
    print("В марте \(workDay) рабочих дн.")
} else if selectedMonth == april {
    workDay = 30 - holiday
    print("В апреле \(workDay) рабочих дн.")
} else if selectedMonth == may {
    holiday += 1
    workDay = 31 - holiday
    print("В мае \(workDay) рабочих дн.")
} else if selectedMonth == june {
    holiday += 1
    workDay = 30 - holiday
    print("В июне \(workDay) рабочих дн.")
}else if selectedMonth == jule {
    workDay = 31 - holiday
    print("В июле \(workDay) рабочих дн.")
} else if selectedMonth == august {
    workDay = 31 - holiday
    print("В августе \(workDay) рабочих дн.")
} else if selectedMonth == september {
    workDay = 30 - holiday
    print("В сентябре \(workDay) рабочих дн.")
} else if selectedMonth == oсtober {
    workDay = 31 - holiday
    print("В октябре \(workDay) рабочих дн.")
} else if selectedMonth == november {
    holiday += 1
    workDay = 30 - holiday
    print("В ноябре \(workDay) рабочих дн.")
} else if selectedMonth == december {
    workDay = 31 - holiday
    print("В декабре \(workDay) рабочих дн.")
} else {
    print("Ошибка. Выберите месяц для проверки кол-ва рабочих дней.")
}

//task 2
holiday = 8
workDay = 0
switch selectedMonth {
case january:
    holiday += 8
    workDay = 31 - holiday
    print("В январе \(workDay) рабочих дн.")
case february:
    holiday += 1
    workDay = 28 - holiday
    print("В феврале \(workDay) рабочих дн.")
case march:
    holiday += 1
    workDay = 31 - holiday
    print("В марте \(workDay) рабочих дн.")
case april:
    workDay = 30 - holiday
    print("В апреле \(workDay) рабочих дн.")
case may:
    holiday += 1
    workDay = 31 - holiday
    print("В мае \(workDay) рабочих дн.")
case june:
    holiday += 1
    workDay = 30 - holiday
    print("В июне \(workDay) рабочих дн.")
case jule:
    workDay = 31 - holiday
    print("В июле \(workDay) рабочих дн.")
case august:
    workDay = 31 - holiday
    print("В августе \(workDay) рабочих дн.")
case september:
    workDay = 30 - holiday
    print("В сентябре \(workDay) рабочих дн.")
case oсtober:
    workDay = 31 - holiday
    print("В октябре \(workDay) рабочих дн.")
case november:
    holiday += 1
    workDay = 30 - holiday
    print("В ноябре \(workDay) рабочих дн.")
case december:
    workDay = 31 - holiday
    print("В декабре \(workDay) рабочих дн.")
default:
    print("Ошибка. Выберите месяц для проверки кол-ва рабочих дней.")
}

//task 3
var isHoliday = true
isHoliday == true ? print("Сейчас будний день") : print("Сейчас выходной день")

//task 4
enum SelectedMonth {
    case january
    var description: String {
        switch self {
        case .january: return "Январь"
        case .february: return "Февраль"
        case .march: return "Март"
        case .april: return "Апрель"
        case .may: return "Май"
        case .june: return "Июль"
        case .jule: return "Июль"
        case .august: return "Август"
        case .september: return "Сентябрь"
        case .oсtober: return "Октябрь"
        case .november: return "Ноябрь"
        case .december: return "Декабрь"
        }
    }
    case february
    case march
    case april
    case may
    case june
    case jule
    case august
    case september
    case oсtober
    case november
    case december
}

print("\(SelectedMonth.february.description) имеет тип данных: \(type(of: SelectedMonth.february.description))")
print(SelectedMonth.february.description)
