//
//  Weather.swift
//  MLWeatherApp
//
//  Created by Simeng Liu on 8/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import Foundation
import UIKit

class Weather: NSObject {
    
    var summary,icon: String
    var time: Int
    var temperatureMin,temperatureMax,humidity,windSpeed,pressure: Double
    
    init(time:Int,summary: String,icon:String,temperatureMin:Double,temperatureMax:Double,humidity:Double,pressure:Double,windSpeed:Double) {
        self.summary = summary
        self.time = time
        self.temperatureMin = temperatureMin
        self.temperatureMax = temperatureMax
        self.icon = icon
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
        
    }
}
