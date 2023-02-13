import UIKit
func timeStation (startStation: String, finishStation: String) -> Int {
    let stations : [(name: String, time: Int)] = [("Коменда", 0), ("Старуха", 3), ("Зенит", 6), ("Чкаловкая", 8), ("Спортивная", 12), ("Петроградка", 14), ("Горьковская", 16), ("Садовая", 19)]
    let startStationValid = stations.contains { (name: String, time: Int) in
        name == startStation
    }
    let finishStationValid = stations.contains { (name: String, time: Int) in
        name == finishStation
    }
    var startTime  : Int = 0
    var finishTime : Int = 0
    var resultTimeWay : Int = 0
    if startStationValid && finishStationValid {
        for key in stations {
            if startStation == key.name {
                startTime = key.time
            }
            if finishStation == key.name {
                finishTime = key.time
            }
        }
        resultTimeWay = finishTime - startTime
        print(resultTimeWay)
    } else if startStationValid {
        print("Конечная станция указана неверно")
    } else if finishStationValid {
        print("Начальная станция указана неверно")
    }
    return resultTimeWay
}
timeStation(startStation: "Зенит", finishStation: "Горьковская")
