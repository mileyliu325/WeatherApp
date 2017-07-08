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
