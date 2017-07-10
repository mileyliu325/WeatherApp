//
//  WeatherData.swift
//  MLWeatherApp
//
//  Created by Simeng Liu on 10/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherData: Mappable {
    
    var summary, icon: String?
    var time: Int?
    var temperatureMin, temperatureMax, humidity, windSpeed, pressure: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        icon <- map["icon"]
        
        time <- map["time"]
        
        temperatureMin <- map["temperatureMin"]
        
        temperatureMax <- map["temperatureMax"]
        
        summary <- map["summary"]
        
        humidity <- map["humidity"]
        
        pressure <- map["pressure"]
        
        windSpeed <- map["windSpeed"]
    }
    
}


