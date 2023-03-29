import UIKit

enum Author {
    case LinkinPark
    case Evanescence
    case Sting
    case Queen
    case Maksim
    case LudovicoEinaudi
}

class Track {
    enum Country {
        case Russia
        case Finland
        case Ukraine
        case Poland
        case UnitedStates
    }
    
    var name: String
    var author: Author
    var time: Double
    var country: Country
    
    init(name: String, author: Author, time: Double, country: Country) {
        self.name = name
        self.author = author
        self.time = time
        self.country = country
    }
}

class Category {
    var name: String
    var author: Author
    lazy var trackList: [Track] = []
    var countTrackList : Int {
        return trackList.count
    }
    
    init(name: String, author: Author) {
        self.name = name
        self.author = author
    }
    
    //    Добавление треков (по экземпляру)
    func addTrack(newTrack: Track) {
        trackList.append(newTrack)
    }
    
    //    Удаление треков по названию
    func removeTrackbyName(delNameTrack: String) {
        for (i,j) in trackList.enumerated() {
            if (j.name == delNameTrack) {
                print(i,j.name)
                trackList.remove(at: i)
            }
        }
    }
    
    //    Удаление треков по экземпляру
    func removeTrack(delNameTrack: Track) {
        for (i,j) in trackList.enumerated() {
            if (j.name == delNameTrack.name) {
                trackList.remove(at: i)
                print("Трек \(delNameTrack.name) удален")
            }
        }
    }
    
    
}

class Library {
    var name: String
    lazy var categoryList: [Category] = []
    var countCategoryList : Int {
        return categoryList.count
    }
    
    init(name: String) {
        self.name = name
    }
    
    func addCategory(newCategory: Category) {
        categoryList.append(newCategory)
    }
    func changeCategoryByTrack(track: Track, inCategory: Category, toCategory: Category) {
        inCategory.removeTrackbyName(delNameTrack: track.name)
        toCategory.addTrack(newTrack: track)
    }
}

var library = Library(name: "Библиотека Жени")

var category1 = Category(name: "Rock", author: Author.Evanescence)
var category2 = Category(name: "Pop", author: Author.Maksim)
var category3 = Category(name: "Classic", author: Author.LudovicoEinaudi)

var track1 = Track(name: "My Immortal", author: Author.Evanescence, time: 264, country: Track.Country.UnitedStates)
var track2 = Track(name: "Bring Me To Life", author: Author.Evanescence, time: 231, country: Track.Country.UnitedStates)
var track3 = Track(name: "Hello Cat", author: Author.Evanescence, time: 182, country: Track.Country.UnitedStates)

library.addCategory(newCategory: category1)
library.addCategory(newCategory: category2)
library.addCategory(newCategory: category3)

category1.addTrack(newTrack: track1)
category1.addTrack(newTrack: track2)
category1.addTrack(newTrack: track3)

print("---")

//Проверка кол-ва треков в категории 1
for i in category1.trackList {
    print(i.name)
}
//Удалим трек My Immortal из категории
//category1.removeTrackbyName(delNameTrack: "My Immortal")
category1.removeTrack(delNameTrack: track1 )


//Проверка кол-ва треков в категории 1
for i in category1.trackList {
    print(i.name)
}

//Проверка кол-ва треков в категории 2
for i in category2.trackList {
    print(i.name)
}

//Перенос трека с категории 1 в категорию 2
library.changeCategoryByTrack(track: track3, inCategory: category1, toCategory: category2)


//Проверка кол-ва треков в категории 1
for i in category1.trackList {
    print(i.name)
}

//Проверка кол-ва треков в категории 2
for i in category2.trackList {
    print(i.name)
}



