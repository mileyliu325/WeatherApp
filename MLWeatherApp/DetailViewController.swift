//
//  DetailViewController.swift
//  MLWeatherApp
//
//  Created by Simeng Liu on 8/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var sendData : Any?

    @IBOutlet weak var iconImageView: UIImageView!

    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var highTempLabel: UILabel!
    
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if((sendData) != nil) {
            drawUI()
        }
    }
    
    func drawUI() {
        
        
        let weather = sendData as! WeatherData
        
        self.title =  changeUTCtoDate(UTCString: weather.time!)
        
        iconImageView.image = UIImage(named: imageCase(iconString: weather.icon!))
        
        
        summaryLabel.text = String("Summary:\(weather.summary!)")
        
        highTempLabel.text = String("Highest Tempature: \(Int(weather.temperatureMax!))°F")
        
        lowTempLabel.text = String("Lowest Tempature: \(Int(weather.temperatureMin!))°F")
        
        humidityLabel.text = String("Humidity: \(Int(weather.humidity!*100))%")
        
        pressureLabel.text = String("Pressure: \(Int(weather.pressure!))hPa")
        
        windSpeedLabel.text = String("Wind Speed : \(Int(weather.windSpeed!))m/s")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
}
