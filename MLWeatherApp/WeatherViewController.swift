//
//  WeatherViewController.swift
//  MLWeatherApp
//
//  Created by Simeng Liu on 8/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data : NSMutableArray = NSMutableArray()


    @IBOutlet weak var weatherTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        self.weatherTableView.delegate = self
        self.weatherTableView.dataSource = self
            }

    func loadData(){
        
        SVProgressHUD.show()
        
        var url : String?
        url = String(format: "%@", "https://api.darksky.net/forecast/b62e7568029db044941059558da9a1a1/37.8267,-122.4233")
        
        Alamofire.request(url!)
            .validate()
            .responseJSON {
                response in
                
                if  response.result.isFailure{
                
                    print("no response")
                    
                    SVProgressHUD.dismiss()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    let alert = UIAlertController(title: "Alert", message: "No response", preferredStyle: UIAlertControllerStyle.alert)
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
                if let result = response.result.value {
                    
                    //get daily temperature
                    var resultArray : NSArray = NSArray()
                    
                    if (result as! NSDictionary).object(forKey: "daily") is NSDictionary
                    {
                        let dailyResultDic = (result as! NSDictionary).object(forKey: "daily") as! NSDictionary
                        
                        
                        if(dailyResultDic.object(forKey: "data") != nil){
                            
                            let dailyData = dailyResultDic.object(forKey: "data")
                            
                            resultArray = dailyData as! NSArray
                            
                            
                        }
                        else {
                            print("No daily data returned")
                            
                        }
                        
                    }
                        
                    else {
                        print("sever problem")
                    }
                    
                    if resultArray.count == 0
                    {
                        SVProgressHUD.dismiss()
                        UIApplication.shared.endIgnoringInteractionEvents()
                        return
                    }
                    
                    for index in stride(from: 0, to: resultArray.count, by: 1) {
                        
                        let icon = (resultArray[index] as! NSDictionary).object(forKey: "icon")
                        
                        let time = (resultArray[index] as! NSDictionary).object(forKey: "time")
                        
                        let temperatureMin = (resultArray[index] as! NSDictionary).object(forKey: "temperatureMin")
                        
                        let temperatureMax = (resultArray[index] as! NSDictionary).object(forKey: "temperatureMax")
                        
                        let summary = (resultArray[index] as! NSDictionary).object(forKey: "summary")
                        
                        let humidity = (resultArray[index] as! NSDictionary).object(forKey: "humidity")
                        
                        let pressure = (resultArray[index] as! NSDictionary).object(forKey: "pressure")
                        
                        let windSpeed = (resultArray[index] as! NSDictionary).object(forKey: "windSpeed")
                        
                    let weathers = Weather(time:time as! Int,
                                               summary: summary as! String,
                                               icon:icon as! String,
                                               temperatureMin:temperatureMin as! Double,
                                               temperatureMax:temperatureMax as! Double,
                                               humidity:humidity as! Double,
                                               pressure:pressure as! Double,
                                               windSpeed:windSpeed as! Double
                        )
                        
                        self.data.add(weathers)
                        
                        
                    }
                    self.weatherTableView.reloadData()
                    SVProgressHUD.dismiss()
                    
                }
        }

        
        
        
    }
    
    // MARK: - Tableview delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var weather : Weather
        
        weather = self.data[indexPath.row] as! Weather
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! WeatherTableViewCell

        
        cell.dateLabel.text = changeUTCtoDate(UTCString: weather.time)
        
        let tempMin = Int(weather.temperatureMin)
        let tempMax = Int(weather.temperatureMax)
        
        cell.tempLabel.text = String("\(tempMin)°F-\(tempMax)°F")
        
        let imageName = imageCase(iconString: weather.icon)
        cell.iconImageView.image = UIImage(named: imageName)
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let indexPath = tableView.indexPathForSelectedRow!
        
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        var weather : Weather
        
        weather = self.data[indexPath.row] as! Weather

        performSegue(withIdentifier:"toDetail", sender: weather as Any)
   
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetail"){
            
            let nextViewController = segue.destination as! DetailViewController
            
            nextViewController.sendData = sender
        }
        
    }


}
