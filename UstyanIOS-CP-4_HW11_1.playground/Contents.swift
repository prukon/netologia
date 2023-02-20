import UIKit

enum Chanels: String {
    case firstChannel =  "1 канал"
    case secondChannel = "2 канал"
    case thirdChannel =  "3 канал"
    case fourthChannel = "4 канал"
    case fifthhChannel = "5 канал"
}

//task1
class Television {
    var brandModel: (String, String)
    var isOn: Bool
    var currentChannel: Chanels
    
    init(brandModel: (String, String), isOn: Bool, currentChannel: Chanels) {
        self.brandModel = brandModel
        self.isOn = isOn
        self.currentChannel = currentChannel
    }
    
    func showCurrentChannel(){
        if isOn {
            print("Вы смотрите \(currentChannel.rawValue).")
        } else {
            print("Телевизор выключен.")
        }
    }
}
var television = Television(brandModel: ("Заря", "Модель 1"), isOn: true, currentChannel: Chanels.secondChannel)

//Проверка ТВ
television.showCurrentChannel()

//Смена канала. Проверка ТВ
television.currentChannel = .firstChannel
television.showCurrentChannel()

//Выключение ТВ. Проверка ТВ.
television.isOn = false
television.showCurrentChannel()


//task2
print("____")
struct SettingsTV  {
    var volume: Double
    var isColorView: Bool
}

enum VideoFormat: String {
    case tvChannel   = "режим просмотра каналов"
    case videoByPort = "режим видео по входящему видео порту"
}
class NewTelevision: Television {
    private var currentVolume: Double = 0
    var currentVideoFormat: VideoFormat
    var maxVolume: Double = 1
    var settings: SettingsTV {
        willSet {
            if newValue.volume > maxVolume {
                self.currentVolume = 1
            } else if newValue.volume < 0 {
                self.currentVolume = 0
            } else {
                currentVolume = newValue.volume
            }
        }
    }

    init(currentVideoFormat: VideoFormat, settings: SettingsTV) {
        self.currentVideoFormat = currentVideoFormat
        self.settings = settings
        super.init(brandModel: ("Заря", "Модель 1"), isOn: true, currentChannel: Chanels.firstChannel)
    }
    
    override func showCurrentChannel(){
        var colorViewDesc: String
        if settings.isColorView {
            colorViewDesc = "цветной"
        } else {
            colorViewDesc = "черно-белый"
        }
        
        if currentVideoFormat == .tvChannel {
            print("Вы смотрите \(currentVideoFormat.rawValue).")
            print("Активный канал: \(currentChannel.rawValue).")
            print("Режим дисплея: \(colorViewDesc).")
            print("Громкость: \(currentVolume). ")
        } else if currentVideoFormat == .videoByPort{
            print("Вы смотрите \(VideoFormat.videoByPort.rawValue).")
            print("Режим дисплея: \(colorViewDesc).")
            print("Громкость: \(currentVolume). ")
        }
    }
}

//Просмотр ТВ
var newTelevision = NewTelevision(currentVideoFormat: .tvChannel, settings: SettingsTV.init(volume: 0.4, isColorView: true))
newTelevision.settings.volume = 1.3

newTelevision.showCurrentChannel()
newTelevision.currentVideoFormat

print("__")

//Просмотр видео по видео порту
var newTelevision2 = NewTelevision(currentVideoFormat :.videoByPort, settings: SettingsTV.init(volume: 0.4, isColorView: true))
newTelevision2.settings.volume = 0.5
newTelevision2.showCurrentChannel()
