import UIKit

//Задание №1
enum Channels: String {
    case button1 = "FirstChannel"
    case button2 = "Culture"
    case button3 = "Discovery"
    case button4 = "Discovery 2"
    case button5 = "FoXKids"
   
}

class Tv {
    
    let firmAndModel: [String:String]
    var tvIsOn: Bool
    var currentChannel: Channels
    
    init (firmAndModel: [String:String], tvIsOn: Bool, currentChannel:Channels) {
        self.firmAndModel = firmAndModel
        self.currentChannel = currentChannel
        self.tvIsOn = tvIsOn
    }
    
    
    func seeTV() {
        if tvIsOn {
            print("По телеку щас идет - \(currentChannel.rawValue)")
        } else {
            print("TV is OFF")
        }
    }
}

var television = Tv(firmAndModel: ["Sony":"Bravia"], tvIsOn: true, currentChannel: Channels.button2)

    television.seeTV()
television.currentChannel = .button4
television.seeTV()


//Задание № 2

struct NewSettings {
    var volume: Double
    var colorMode: Bool
}

print("-------------------------------------------------------------------------")

class NewTV: Tv {
   private var volumeTV: Double = 0
    var newSettings: NewSettings {
        willSet {
            if newValue.volume > 1.0 {
                volumeTV = 1.0
            } else if newValue.volume < 0 {
                volumeTV = 0
            } else {
                volumeTV = newValue.volume
            }
        }
    }
    
    
    init(firmAndModel: [String : String], tvIsOn: Bool, currentChannel: Channels,newSettings: NewSettings) {
        self.newSettings = newSettings
        super.init(firmAndModel: firmAndModel, tvIsOn: tvIsOn, currentChannel: currentChannel)
    }
    
   
    
    override func seeTV() {
        if tvIsOn {
            print("По телеку щас идет - \(currentChannel.rawValue)")
            print("Громкость - \(volumeTV)")
            if newSettings.colorMode {
                print("Цветной режим -Вкл.")
            } else {
                print("Цветной режим -Выкл.")
            }
        } else {
            print("TV is OFF")
        }
       
    }
    
    
}

let lgTV = NewTV(firmAndModel: ["Ld" : "new"], tvIsOn: true, currentChannel:Channels.button5, newSettings: NewSettings.init(volume: 0.5, colorMode: true) )



print("-")
lgTV.seeTV()
lgTV.newSettings.volume = 0.3
lgTV.seeTV()
lgTV.newSettings.volume = 2.0
lgTV.seeTV()
lgTV.newSettings.volume = -2.0
lgTV.seeTV()
lgTV.newSettings.volume = 0.5
lgTV.seeTV()
