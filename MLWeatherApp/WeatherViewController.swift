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

class WeatherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data : NSMutableArray = NSMutableArray()


    @IBOutlet weak var weatherTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        self.weatherTableView.delegate=self
        self.weatherTableView.dataSource=self
        // Do any additional setup after loading the view.
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
                    
                    print(result)
                    
                    //get daily temperature
                    var resultArray : NSArray = NSArray()
                    
                    if (result as! NSDictionary).object(forKey: "daily") is NSDictionary
                    {
                        let dailyResultDic = (result as! NSDictionary).object(forKey: "daily") as! NSDictionary
                        
                        
                        if(dailyResultDic.object(forKey: "data") != nil){
                            
                            let dailyData = dailyResultDic.object(forKey: "data")
                            
                            print("dailyData:\(dailyData)")
                            
                            resultArray = dailyData as! NSArray
                            
                            print("resultArray1:\(resultArray.count)")
                            
                        }
                        else {
                            print("No daily data returned")
                            
                        }
                        
                    }
                        
                    else {
                        print("sever problem")
                    }
                    
                    
                    
                    print("resultArray2:\(resultArray.count)")
                    
                    if resultArray.count == 0
                    {
                        SVProgressHUD.dismiss()
                        UIApplication.shared.endIgnoringInteractionEvents()
                        return
                    }
                    
                    for index in stride(from: 0, to: resultArray.count, by: 1) {
                        
                        let icon = (resultArray[index] as! NSDictionary).object(forKey: "icon")
                        
                        print("icon:\(icon)")
                        
                        let time = (resultArray[index] as! NSDictionary).object(forKey: "time")
                        
                        print("time:\(time)")
                        
                        let temperatureMin = (resultArray[index] as! NSDictionary).object(forKey: "temperatureMin")
                        
                        print("temperatureMin:\(temperatureMin)")
                        
                        let temperatureMax = (resultArray[index] as! NSDictionary).object(forKey: "temperatureMax")
                        
                        print("temperatureMax:\(temperatureMax)")
                        
                        let summary = (resultArray[index] as! NSDictionary).object(forKey: "summary")
                        
                        print("summary:\(summary)")
                        
                        let humidity = (resultArray[index] as! NSDictionary).object(forKey: "humidity")
                        
                        print("humidity:\(humidity)")
                        
                        let pressure = (resultArray[index] as! NSDictionary).object(forKey: "pressure")
                        
                        print("pressure:\(pressure)")
                        
                        let windSpeed = (resultArray[index] as! NSDictionary).object(forKey: "windSpeed")
                        
                        print("windSpeed:\(windSpeed)")
                        
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
                    
                    //                
                    //                self.loadUsersFollowDetail(){
                    //                    self.setTable()
                    //                    UIApplication.shared.endIgnoringInteractionEvents()
                    //                    SVProgressHUD.dismiss()
                    //                }
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
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! WeatherTableViewCell
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you select cell\(indexPath.row)")
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


}
