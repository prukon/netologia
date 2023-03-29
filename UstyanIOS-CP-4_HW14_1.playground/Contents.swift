import UIKit

//task1
enum Style {
    case pop
    case rock
}

enum Country {
    case Russia
    case Finland
    case Ukraine
    case Poland
    case UnitedStates
}

class Artist {
    var name: String
    var country: Country
    var style: Style
    var track = "My Immortal"
    
    
    init(name: String, country: Country, style: Style) {
        self.name = name
        self.country = country
        self.style = style
    }
    
    func writeTrack () {
        print("Я, \(name), написал трек \(track).")
    }
    func singTrack() {
        print("Я, \(name), исполнил трек \(track).")
    }
}

final class CheerfulArtist: Artist {
    var supportCommand: String = "Группа поддержки \"Веселые котики\""
    
    func demonstrateGreeting () {
        print("\(supportCommand) выступает перед концертом!")
    }
    override func writeTrack () {
        print("Я, \(name), написал веселый трек.")
    }
    override func singTrack() {
        print("Я, \(name), исполнил веселый трек.")
    }
}

final class SadArtist: Artist {
    var priceTicket: Int
    
    init(priceTicket: Int, name: String, country: Country, style: Style){
        self.priceTicket = priceTicket
        super.init(name: name, country: country, style: style)
    }
    
    func GetPrice() {
        print("Стоимость билета = \(priceTicket)")
    }
    override func writeTrack () {
        print("Я, \(name), написал грустный трек.")
    }
    override func singTrack() {
        print("Я, \(name), исполнил грустный трек.")
    }
}

final class PopularArtist: Artist {
    var tourDate: String
    
    init(tourDate: String, name: String, country: Country, style: Style){
        self.tourDate = tourDate
        super.init(name: name, country: country, style: style)
    }
    
    func showTourDate () {
        print("Ближайший тур состоится \(tourDate) в Москве.")
    }
    
    override func writeTrack () {
        print("Я, \(name), написал очерендной популярный трек.")
    }
    override func singTrack() {
        print("Я, \(name), исполнил очерендной популярный трек.")
    }
}

var cheerfulArtist = CheerfulArtist(name: "Петя", country: .Finland, style: .pop)
var sadArtist = SadArtist(priceTicket: 1500, name: "Оля", country: .Finland, style: .rock)
var popularArtist = PopularArtist(tourDate: "14.05.2023", name: "Саша", country: .Russia, style: .rock)

//Вызываем унаследованный метод
popularArtist.singTrack()

//Вызываем уникальный метод сабкласса
cheerfulArtist.demonstrateGreeting()
sadArtist.GetPrice()
popularArtist.showTourDate()

//task3
var artists = [Artist]()

artists.append(cheerfulArtist)
artists.append(sadArtist)
artists.append(popularArtist)

/*
 С темой был знаком ранее, поэтотому с ней не возникло сложностей.
 Из нового - понял, что при вызове super.init в дочернем классе необязательно устанавливать значения пропертям родителя. Достаточно передать параметры этих пропертей в init ими инициализировать проперти. Пример с PopularArtist и sadArtist.
 
 Это тема, на которую я потратил больше всего времени, относительно других тем при  изучения курса Скутаренко.
 Уровень понимая данной темы 9 из 10
 
 */
