// Task - 1

enum Chanel: String {
    case firstChannel =  "RBK"
    case secondChannel = "CNN"
    case thirdChannel =  "BBC"
    case fourthChannel = "Comedy"
    case fifthhChannel = "2x2"
}

class Television {
    var brandModel: [String: String]
    var isOn: Bool
    var currentChannel: Chanel

    init(brandModel: [String: String], isOn: Bool, currentChannel: Chanel) {
        self.brandModel = brandModel
        self.isOn = isOn
        self.currentChannel = currentChannel
    }

    func showCurrentChannel() {
        if isOn {
            print("Телевизор \(brandModel) показывает \(currentChannel.rawValue)")
        } else {
            print("Телевизор выключен")
        }
    }
}
var television = Television(brandModel: ["LG": "A500"], isOn: true, currentChannel: Chanel.firstChannel)
television.showCurrentChannel()
var television2 = Television(brandModel: ["LG": "A500"], isOn: false, currentChannel: Chanel.secondChannel)
television2.showCurrentChannel()




// Task - 2

struct Settings {
    var colorMode: Bool
    var volume: Double
    
}

class SecondTelevision: Television {
    
    var curVolume : Double = 0
    var settings: Settings {
        
        willSet {
            if newValue.volume > 1.0 {
                curVolume = 1.0
            } else if newValue.volume < 0.0 {
                curVolume = 0.0
            } else {
                curVolume = newValue.volume
            }
        }
    }
    
    init(brandModel: [String : String], isOn: Bool, currentChannel: Chanel, settings: Settings) {
        self.settings = settings
        super.init(brandModel: brandModel, isOn: isOn, currentChannel: currentChannel)
    }
    
    override func showCurrentChannel() {
        if isOn {
            print("Телевизор\(brandModel) показывает \(currentChannel.rawValue)")
            print("Громкость телевизора \(curVolume)")
            if settings.colorMode {
                print("Телевизор \(brandModel) показывает цветным")
            } else {
                print("Телевизор \(brandModel) показывает черно-белым")
            }
        } else {
            print("Телевизор выключен")
        }
    }
}
var secondTelevision = SecondTelevision(brandModel: ["Samsung" : "U5400"], isOn: true, currentChannel: Chanel.fourthChannel, settings: Settings(colorMode: true, volume: 1.3))

print("----")

secondTelevision.showCurrentChannel()
secondTelevision.settings.volume = 2
secondTelevision.showCurrentChannel()
secondTelevision.settings.volume = -2
secondTelevision.showCurrentChannel()
secondTelevision.settings.volume = 1.2
secondTelevision.showCurrentChannel()


private var curValue
