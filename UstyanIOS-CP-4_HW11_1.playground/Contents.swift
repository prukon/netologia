import UIKit

//task1
class Television {
    
    enum Chanels: String {
        case firstChannel =  "1 канал"
        case secondChannel = "2 канал"
        case thirdChannel =  "3 канал"
        case fourthChannel = "4 канал"
        case fifthhChannel = "5 канал"
    }
    
    var brandModel: (String, String)
    var enable: Bool
    var currentChannel: Chanels
    
    init(brandModel: (String, String), enable: Bool, currentChannel: Chanels) {
        self.brandModel = brandModel
        self.enable = enable
        self.currentChannel = currentChannel
    }
    
    func showCurrentChannel(){
        print("Вы смотрите \(currentChannel.rawValue).")
    }
}
var television = Television(brandModel: ("Заря", "Модель 1"), enable: true, currentChannel: Television.Chanels.secondChannel)

television.showCurrentChannel()
television.currentChannel = .firstChannel
television.showCurrentChannel()

//task2

print("____")

struct SettingsTelevision  {
    var volume: Double
    var isColorView: Bool
}

let settingsTelevision = SettingsTelevision.init(volume: 0.4, isColorView: true)

class NewTelevision: Television {
    
    enum VideoFormat: String {
        case tvChannel   = "режим просмотра каналов"
        case videoByPort = "режим видео по входящему видео порту"
    }
    
    private var currentVolume: Double = 0
    var currentVideoFormat: VideoFormat
    var isColorView = settingsTelevision.isColorView
    var maxVolume: Double = 1
    var volume: Double = settingsTelevision.volume {
        willSet {
            if newValue > maxVolume {
                self.currentVolume = 1
            } else if newValue < 0 {
                self.currentVolume = 0
            } else {
                currentVolume = newValue
            }
        }
    }
    init( isColorView: Bool, currentVideoFormat: VideoFormat) {
        self.isColorView = isColorView
        self.currentVideoFormat = currentVideoFormat
        super.init(brandModel: ("Заря", "Модель 1"), enable: true, currentChannel: Television.Chanels.firstChannel)
    }
    
    override func showCurrentChannel(){
        var colorViewDesc: String
        if isColorView {
            colorViewDesc = "цветной"
        } else {
            colorViewDesc = "черно-белый"
        }
        
        if currentVideoFormat == .tvChannel {
            print("Вы смотрите \(VideoFormat.tvChannel.rawValue).")
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

//Просмотр TV
var newTelevision = NewTelevision(isColorView: false, currentVideoFormat :.tvChannel)
newTelevision.volume = 1.3
newTelevision.showCurrentChannel()

print("__")

//Просмотр видео по видео порту
var newTelevision2 = NewTelevision(isColorView: false, currentVideoFormat :.videoByPort)
newTelevision2.volume = 0.5
newTelevision2.showCurrentChannel()
