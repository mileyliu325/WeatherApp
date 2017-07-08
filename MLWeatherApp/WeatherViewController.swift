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

class WeatherViewController: UIViewController,,UITableViewDelegate,UITableViewDataSource {
    
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
    
    
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
