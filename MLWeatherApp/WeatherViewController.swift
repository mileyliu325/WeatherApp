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
import ObjectMapper

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data : NSMutableArray = NSMutableArray()

    @IBOutlet weak var weatherTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        self.weatherTableView.delegate = self
        self.weatherTableView.dataSource = self
    }

    func loadData() {
        
        SVProgressHUD.show()
        
        var url : String?
        
        url = String(format: "%@", "https://api.darksky.net/forecast/b62e7568029db044941059558da9a1a1/37.8267,-122.4233")
        
        Alamofire.request(url!)
            .validate()
            .responseJSON {response in
                switch response.result {
                    case .success(let value):
                    
                        let daily = (value as! [String:Any]) ["daily"] as! [String:Any]
                        let data = daily ["data"] as! [Any]
                   
                        for index in stride(from: 0, to: data.count, by: 1){
                        
                            let weather = data[index] as! [String:Any]
                            let weatherData = Mapper<WeatherData>().map(JSONObject: weather)
                        
                            self.data.add(weatherData as Any)
                        }
                        self.weatherTableView.reloadData()
                   
                    SVProgressHUD.dismiss()
                    
                case .failure(let error):
                    
                    print("Request Error:\(error)")
                    
                    SVProgressHUD.dismiss()
                    
                    let alert = UIAlertController(title: "Alert", message: "Request Time out, please Check your Network", preferredStyle: UIAlertControllerStyle.alert)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
        }
    }
    
    // MARK: - Tableview delegate
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.data.count
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var weather : WeatherData
        
        weather = self.data[indexPath.row] as! WeatherData
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! WeatherTableViewCell
        
        cell.dateLabel.text = changeUTCtoDate(UTCString: weather.time!)
        
        let tempMin = Int(weather.temperatureMin!)
        
        let tempMax = Int(weather.temperatureMax!)
        
        cell.tempLabel.text = String("\(tempMin)°F-\(tempMax)°F")
        
        let imageName = imageCase(iconString: weather.icon!)
        
        cell.iconImageView.image = UIImage(named: imageName)
        
        return cell
        
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let indexPath = tableView.indexPathForSelectedRow!
        
        _ = tableView.cellForRow(at: indexPath)! as UITableViewCell
       
        var weather : WeatherData
        
        weather = self.data[indexPath.row] as! WeatherData
       
        performSegue(withIdentifier:"toDetail", sender: weather as Any)
   
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            
            let nextViewController = segue.destination as! DetailViewController
            
            nextViewController.sendData = sender
        }
    }
}
