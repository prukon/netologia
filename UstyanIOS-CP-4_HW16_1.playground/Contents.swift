import UIKit

enum Color {
    case red
    case white
    case black
}

enum SpecialOfferError: Error {
    case yearOfReleaseIsNotOld
}

enum Accessories: String, CaseIterable {
    case tinting = "Tinting"
    case alarmSystem = "AlarmSystem"
    case sportsDiscs = "SportsDiscs"
    case firstAidKit = "First aid kit car"
    case fireExtinguisher = "Fire extinguisher"
}

protocol CarProtocol {
    var model: String { get }
    var color: Color { get }
    var buildDate: (Int, Int, Int) { get }
    var price: Double { get set }
    var accessories : [Accessories] { get set }
    var isServiced: Bool { get set }
    var specialOffer: Bool  { get set }
}

protocol DealershipProtocol {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [CarProtocol] { get set }
    var showroomCars: [CarProtocol] { get set }
    var cars: [CarProtocol] { get set }
    
    func offerAccesories (accessories: [Accessories])
    func presaleService (car: inout Cars)
    func addToShowroom (car: inout Cars)
    func sellCar (car: inout Cars)
    func orderCar ()
}

protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer(car: CarProtocol) throws
}
struct Cars: CarProtocol {
    var model: String
    var color: Color
    var buildDate: (Int, Int, Int)
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
    var specialOffer = false
}

class Dealership : DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol] {
        get {
            return stockCars + showroomCars
        }
        set {
            let sc = newValue.dropLast(showroomCars.count)
            let shc = newValue.dropFirst(sc.count)
            stockCars = Array(sc)
            showroomCars = Array(shc)
        }
    }
    
    init (name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func offerAccesories(accessories: [Accessories]) {
        let newAccessories: [String] = Accessories.allCases.map { $0.rawValue }
        print("Вы можете приобрести Аксессуары: \(newAccessories.joined(separator:", ")).")
    }
    func orderCar() {
        if var newAuto = fabrik.randomElement() {
            newAuto.buildDate = (Calendar.current.component(.day, from: Date()), Calendar.current.component(.month, from: Date()), Calendar.current.component(.year, from: Date()))
            newAuto.isServiced = false
            newAuto.specialOffer = false
            stockCars.append(newAuto)
            print("На парковку склада добавен новый автомобиль \(newAuto.model). ")
        }
    }
    func presaleService(car: inout Cars) {
        if car.isServiced {
            print("Предпродажная подготовка автобиля \(car.model) уже была выполнена ранее.")
        } else {
            car.isServiced = true
            print("Предпродажная подготовка автобиля \(car.model) выполнена.")
        }
    }
    func addToShowroom(car: inout Cars) {
        presaleService(car: &car)
        showroomCars.append(car)
        for (i,j) in stockCars.enumerated() {
            if j.model == car.model {
                stockCars.remove(at: i)
            }
        }
        print("Автомобиль \(car.model) перемещен со склада в салон.")
    }
    func sellCar (car: inout Cars) {
        var missedAccessories = [String]()
        var carAccessoriesArray = [String]()
        presaleService(car: &car)
        let  allAccessories = Accessories.allCases.map { $0.rawValue }
        let  carAccessories = car.accessories[0].rawValue
        for i in car.accessories {
            carAccessoriesArray.append(i.rawValue)
        }
        for i in allAccessories {
            if !carAccessoriesArray.contains(i) {
                missedAccessories.append(i)
            }
        }
        print("В автомобиле \(car.model) отсутствует доп. оборудование: \(missedAccessories.joined(separator:", ")). Вы можете приобрести его в салоне.")
        print("Автомобиль \(car.model) продан.")
        
    }
}

//Инициализация автомобилей
var bmw7: Cars = Cars(model: "BMW7", color: .white, buildDate: (22, 2, 2023), price: 5_900_000, accessories: [.tinting, .sportsDiscs], isServiced: false)
var bmw5: Cars = Cars(model: "BMW5", color: .white, buildDate: (21, 4, 2021), price: 4_200_000, accessories: [.tinting, .sportsDiscs], isServiced: false)
var bmw3: Cars = Cars(model: "BMW3", color: .black, buildDate: (19, 1, 2023), price: 3_800_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: false)
var hondaCivic: Cars = Cars(model: "Honda Civic", color: .black, buildDate: (22, 5, 2022), price: 3_200_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: true)
var audiA3: Cars = Cars(model: "Audi A3", color: .red, buildDate: (11, 1, 2023), price: 2_400_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: false)
var audiA4: Cars = Cars(model: "Audi A4", color: .red, buildDate: (12, 2, 2023), price: 2_800_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: false)
var audiA5: Cars = Cars(model: "Audi A5", color: .red, buildDate: (22, 9, 2022), price: 4_500_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: true)
var lexusRX440: Cars = Cars(model: "Lexus RX440", color: .red, buildDate: (10, 12, 2021), price: 5_400_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: false)
var volvoXC90: Cars = Cars(model: "Volvo XC90", color: .black, buildDate: (14, 2, 2021), price: 6_200_000, accessories: [.tinting, .alarmSystem, .sportsDiscs], isServiced: true)
var fabrik: [Cars] = [bmw7, bmw5, bmw3]

//Инициализация  дилерских центров
var bmwDealership   = Dealership(name: "Салон BMW", showroomCapacity: 14, stockCars: [bmw5], showroomCars: [bmw3])
var hondaDealership = Dealership(name: "Салон Honda", showroomCapacity: 24, stockCars: [], showroomCars: [hondaCivic])
var audiDealership  = Dealership(name: "Салон Audi", showroomCapacity: 19, stockCars: [audiA3, audiA5], showroomCars: [audiA4])
var lexusDealership = Dealership(name: "Салон Lexus", showroomCapacity: 18, stockCars: [], showroomCars: [lexusRX440])
var volvoDealership = Dealership(name: "Салон Volvo", showroomCapacity: 22, stockCars: [volvoXC90], showroomCars: [])

//Массив со всеми  дилерскими центрами
var DealershipArray = [bmwDealership, hondaDealership, audiDealership, lexusDealership, volvoDealership]

for i in DealershipArray {
    switch i.name {
    case "Салон BMW"    : print("\(i.name). Слоган: С удовольствием за рулем.")
    case "Салон Honda"  : print("\(i.name). Слоган: Сила воображения.")
    case "Салон Audi"   : print("\(i.name). Слоган: Превосходство высоких технологий.")
    case "Салон Lexus"  : print("\(i.name). Слоган: Бесконечное стремление к совершенству.")
    case "Салон Volvo"  : print("\(i.name). Слоган: Опережает время.")
    default: break
    }
}

extension Dealership: SpecialOffer {
    func addEmergencyPack() {
        for (i,j) in cars.enumerated() {
            if !j.accessories.contains(.fireExtinguisher) {
                cars[i].accessories.append(.fireExtinguisher)
                print("Автомобилю \(cars[i].model) добавлен доп. аксессуар - огнетушитель.")
            }
            if !cars[i].accessories.contains(.firstAidKit) {
                cars[i].accessories.append(.firstAidKit)
                print("Автомобилю \(cars[i].model) добавлен доп. аксессуар - аптечка.")
            }
        }
    }
    func makeSpecialOffer(car: CarProtocol) throws {
        
        for (i,j) in stockCars.enumerated() {
            
            if j.model == car.model {
                
                var oldPrice: Double
               
                
                    guard (stockCars[i].buildDate.2 < Calendar.current.component(.year, from: Date())) else {
                        throw SpecialOfferError.yearOfReleaseIsNotOld
                        }
                
                    if !j.specialOffer {
                        oldPrice = stockCars[i].price
                        stockCars[i].price *= 0.85
                        if !stockCars[i].accessories.contains(.fireExtinguisher) {
                            stockCars[i].accessories.append(.fireExtinguisher)
                            print("Автомобилю \(stockCars[i].model), \(stockCars[i].buildDate.2) добавлен доп. аксессуар - огнетушитель.")
                        }
                        if !stockCars[i].accessories.contains(.firstAidKit) {
                            stockCars[i].accessories.append(.firstAidKit)
                            print("Автомобилю \(cars[i].model), \(stockCars[i].buildDate.2) добавлен доп. аксессуар - аптечка.")
                        }
                        stockCars[i].specialOffer = true
                        print("Стоимость автомобиля \(cars[i].model), \(stockCars[i].buildDate.2) уменьшена на 15% и теперь составляет \(Int(stockCars[i].price)) руб. вместо \(Int(oldPrice)) руб. ")
                        showroomCars.append(stockCars[i])
                        print("Автомобиль \(  stockCars[i].model), \(stockCars[i].buildDate.2) перемещен со склада в салон.")
                        stockCars.remove(at: i)
                    }
            }
        }
        for (i,j) in showroomCars.enumerated() {
            if j.model == car.model {
                    guard (showroomCars[i].buildDate.2 < Calendar.current.component(.year, from: Date())) else {
                        throw SpecialOfferError.yearOfReleaseIsNotOld
                        }
                    if !j.specialOffer {
                        showroomCars[i].price *= 0.85
                        if !showroomCars[i].accessories.contains(.fireExtinguisher) {
                            showroomCars[i].accessories.append(.fireExtinguisher)
                            print("Автомобилю \(showroomCars[i].model), \(showroomCars[i].buildDate.2) добавлен доп. аксессуар - огнетушитель.")
                        }
                        if !showroomCars[i].accessories.contains(.firstAidKit) {
                            showroomCars[i].accessories.append(.firstAidKit)
                            print("Автомобилю \(showroomCars[i].model), \(showroomCars[i].buildDate.2) добавлен доп. аксессуар - аптечка.")
                        }
                        showroomCars[i].specialOffer = true
                        print("Стоимость автомобиля \(cars[i].model), \(showroomCars[i].buildDate.2) уменьшена на 15% и теперь составляет \(Int(showroomCars[i].price)) руб.")
                    }
                
            }
        }
    }
}

print("--addEmergencyPack")
bmwDealership.addEmergencyPack()
print("--makeSpecialOffer")
func checkAllcars (dealership: Dealership, allCars: [CarProtocol]) {
    for i in allCars {
        if !i.specialOffer {
            do {
                try dealership.makeSpecialOffer(car: i)
            } catch {
                print("Автомобиль \(i.model),\(i.buildDate.2), не подходит под условие спецпредложения.")
            }
        }
    }
}
checkAllcars(dealership: audiDealership, allCars: audiDealership.cars)
checkAllcars(dealership: bmwDealership, allCars: bmwDealership.cars)
checkAllcars(dealership: hondaDealership, allCars: hondaDealership.cars)
checkAllcars(dealership: lexusDealership, allCars: lexusDealership.cars)
checkAllcars(dealership: volvoDealership, allCars: volvoDealership.cars)







print("--presaleService")
lexusDealership.presaleService(car: &lexusRX440)
print("--addToShowroom")
volvoDealership.addToShowroom(car: &volvoXC90)
print("--offerAccesories")
bmwDealership.offerAccesories(accessories: [.firstAidKit])
print("--sellCar")
volvoDealership.sellCar(car: &volvoXC90)
print("--orderCar")
bmwDealership.orderCar()
