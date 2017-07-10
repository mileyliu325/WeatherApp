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
    
    var summary, icon: String
    var time: Int
    var temperatureMin, temperatureMax, humidity, windSpeed, pressure: Double
    
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
//    init(dict : [String : AnyObject]) {
//        super.init()
//        setValuesForKeys(dict)
//    }
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        time = (aDecoder.decodeObject(forKey: "time") as! Int?)!
//        
//        icon = (aDecoder.decodeObject(forKey: "icon") as! String?)!
//        summary = (aDecoder.decodeObject(forKey: "summary") as! String?)!
//
//        temperatureMin = (aDecoder.decodeObject(forKey: "temperatureMin") as! Double?)!
//        temperatureMax = (aDecoder.decodeObject(forKey: "temperatureMax") as! Double?)!
//        humidity = (aDecoder.decodeObject(forKey: "humidity") as! Double?)!
//        pressure = (aDecoder.decodeObject(forKey: "pressure") as! Double?)!
//        windSpeed = (aDecoder.decodeObject(forKey: "windSpeed") as! Double?)!
//
//        
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        
//        aCoder.encode(time, forKey: "time")
//        aCoder.encode(icon, forKey: "icon")
//        aCoder.encode(summary, forKey: "summary")
//        aCoder.encode(temperatureMin, forKey: "temperatureMin")
//        aCoder.encode(temperatureMax, forKey: "temperatureMax")
//        aCoder.encode(humidity, forKey: "humidity")
//        aCoder.encode(pressure, forKey: "pressure")
//        aCoder.encode(windSpeed, forKey: "windSpeed")
//    }
//
}
