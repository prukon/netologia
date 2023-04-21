//
//  CarModel.swift
//  TableView
//
//  Created by Shishkin Ivan Sergeevich on 17.04.2023.
//

import UIKit

struct CarModel {
    let name: String
    let image: UIImage
    var description: String?
    
    static func makeMockModel() -> [[CarModel]] {
        var model = [[CarModel]]()
        var section = [CarModel]()
        
        section.append(CarModel(name: "Mercedes Benz",
                              image: UIImage(named: "mercedesBenzC200")!))
        
        section.append(CarModel(name: "Mercedes G500",
                              image: UIImage(named: "mercedesG500")!,
                              description: "Официальный сайт Mercedes-Benz в России - вся информация для настоящих и будущих владельцев автомобилей. Онлайн сервисы покупки, запись на техобслуживание, тест-драйв, кредитный и страховой калькулятор, аренда и многое другое"))
        
        section.append(CarModel(name: "Skoda Kodiaq",
                              image: UIImage(named: "skodaKodiaq")!))
        
        for _ in 0...5 {
            model.append(section)
        }
        
        return model
    }
}
