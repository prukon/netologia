import UIKit

enum Color {
    case red
    case white
    case black
}

protocol CarProtocol {
    var model: String { get }
    var color: Color { get }
    var buildDate: (Int, Int, Int) { get }
    var price: Double { get set }
    var accessories : [String] { get set }
    var isServiced: Bool { get set }
    
//    var specialOffer: Bool  { get set }
}

protocol DealershipProtocol {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [CarProtocol] { get set }
    var showroomCars: [CarProtocol] { get set }
    var cars: [CarProtocol] { get set }
    
    func offerAccesories (accessories: [String])
    func presaleService (car: CarProtocol)
    func addToShowroom (car: CarProtocol)
    func sellCar (car: CarProtocol)
    func orderCar ()
}

struct BMW7: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

struct BMW5: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

struct BMW3: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

struct HondaCivic: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

struct AudiA4: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

struct AudiA5: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}


struct LexusRX440: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

struct VolvoXC90: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}


class BMWDealership : DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol] {
        get {
            return stockCars + showroomCars
        }
        set {
        }
    }
    
    init (name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func offerAccesories(accessories: [String]) {
    }
    func orderCar() {
    }
    func presaleService(car: CarProtocol) {
    }
    func addToShowroom(car: CarProtocol) {
    }
    func sellCar(car: CarProtocol) {
    }

}

class HondaDealership : DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol] {
        get {
            return stockCars + showroomCars
        }
        set {
        }
    }
    
    init (name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func offerAccesories(accessories: [String]) {
    }
    func orderCar() {
    }
    func presaleService(car: CarProtocol) {
    }
    func addToShowroom(car: CarProtocol) {
    }
    func sellCar(car: CarProtocol) {
    }
}

class AudiDealership : DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol] {
        get {
            return stockCars + showroomCars
        }
        set {
        }
    }
    
    init (name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func offerAccesories(accessories: [String]) {
    }
    func orderCar() {
    }
    func presaleService(car: CarProtocol) {
    }
    func addToShowroom(car: CarProtocol) {
    }
    func sellCar(car: CarProtocol) {
    }
}

class LexusDealership : DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol] {
        get {
            return stockCars + showroomCars
        }
        set {
        }
    }
    
    init (name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func offerAccesories(accessories: [String]) {
    }
    func orderCar() {
    }
    func presaleService(car: CarProtocol) {
    }
    func addToShowroom(car: CarProtocol) {
    }
    func sellCar(car: CarProtocol) {
    }
}

class VolvoDealership : DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol] {
        get {
            return stockCars + showroomCars
        }
        set {
        }
    }
    
    init (name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func offerAccesories(accessories: [String]) {
    }
    func orderCar() {
    }
    func presaleService(car: CarProtocol) {
    }
    func addToShowroom(car: CarProtocol) {
    }
    func sellCar(car: CarProtocol) {
    }
}

//Инициализация автомобилей
var bmw7Car = BMW7(model: "BMW7", color: .white, buildDate: (22, 2, 2023), price: 5_900_000, accessories: ["tinting", "SportsDiscs"], isServiced: false)
var bmw5Car = BMW5(model: "BMW5", color: .white, buildDate: (21, 4, 2021), price: 4_200_000, accessories: ["tinting", "SportsDiscs"], isServiced: false)
var bmw3Car = BMW3(model: "BMW3", color: .black, buildDate: (19, 1, 2023), price: 3_800_000, accessories: ["tinting", "AlarmSystem", "SportsDiscs"], isServiced: false)
var hondaCivicCar = HondaCivic(model: "Honda Civic", color: .black, buildDate: (22, 5, 2022), price: 3_200_000, accessories: ["tinting", "AlarmSystem", "SportsDiscs"], isServiced: true)
var audiA4Car = AudiA4(model: "Audi A4", color: .red, buildDate: (12, 2, 2023), price: 2_800_000, accessories: ["tinting", "AlarmSystem", "SportsDiscs"], isServiced: false)
var audiA5Car = AudiA5(model: "Audi A5", color: .red, buildDate: (22, 9, 2022), price: 4_500_000, accessories: ["tinting", "AlarmSystem", "SportsDiscs"], isServiced: true)
var lexusRX440Car = LexusRX440(model: "Lexus RX440", color: .red, buildDate: (10, 12, 2021), price: 5_400_000, accessories: ["tinting", "AlarmSystem", "SportsDiscs"], isServiced: false)
var volvoXC90Car = VolvoXC90(model: "Volvo XC90", color: .black, buildDate: (14, 2, 2021), price: 6_200_000, accessories: ["tinting", "AlarmSystem", "SportsDiscs"], isServiced: true)

//Инициализация салонов
var bmwDealership = BMWDealership(name: "Салон БМВ", showroomCapacity: 14, stockCars: [bmw5Car], showroomCars: [bmw3Car])
var hondaDealership = HondaDealership(name: "Салон Honda", showroomCapacity: 24, stockCars: [], showroomCars: [hondaCivicCar])
var audiDealership = AudiDealership(name: "Салон Ауди", showroomCapacity: 19, stockCars: [], showroomCars: [audiA4Car, audiA5Car])
var lexusDealership = LexusDealership(name: "Салон Лексус", showroomCapacity: 18, stockCars: [], showroomCars: [lexusRX440Car])
var volvoDealership = VolvoDealership(name: "Салон Вольво", showroomCapacity: 22, stockCars: [], showroomCars: [volvoXC90Car])

