//
//  WeatherData.swift
//  DarkSkyWeather
//
//  Created by Mai Pham Quang Huy on 9/12/18.
//  Copyright © 2018 Mai Pham Quang Huy. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherData {
    var temperature: String
    var description: String
    var icon: String
    
    init(data: Any) {
        let json = JSON(data)
        let currentWeather = json["currently"]
        
        if let temperature = currentWeather["temperature"].float {
            self.temperature = String(format: "%.0f", temperature) + "˚F"
        } else {
            self.temperature = "--"
        }
        
        self.description = currentWeather["summary"].string ?? "--"
        self.icon = currentWeather["icon"].string ?? "--"
    }
}
