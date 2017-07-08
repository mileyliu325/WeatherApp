//
//  tools.swift
//  MLWeatherApp
//
//  Created by Simeng Liu on 8/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import Foundation

//date formatted
func changeUTCtoDate(UTCString:Int)->String{
    let sunStr = NSString(format: "%d", UTCString)
    let timer:TimeInterval = sunStr.doubleValue
    let data = NSDate(timeIntervalSince1970: timer)
    
    let formatter = DateFormatter()
    formatter.dateStyle = DateFormatter.Style.short
    //        formatter.dateFormat = "HH:mm"
    formatter.dateFormat = "dd/MM"
    let str:String = formatter.string(from: data as Date)
    return str
}

//
func imageCase(iconString:String) ->String{
    switch iconString {
    case "partly-cloudy-day","partly-cloudy-night":
        return "cloudy"
    case "clear-day":
        return "sunny"
    case "rain":
        return "rain"
    default:
        return "sunny"
    }
    
}

