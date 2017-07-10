//
//  MLWeatherAppTests.swift
//  MLWeatherAppTests
//
//  Created by Simeng Liu on 8/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import XCTest
@testable import MLWeatherApp

class MLWeatherAppTests: XCTestCase {
    
    var weatherVC = WeatherViewController()
    
    
    override func setUp() {
        
        super.setUp()
        
        print("Start testing")
    }
    
    override func tearDown() {
       
        print("End testing")
        
        super.tearDown()
    }
    
    func testDateTransform() {
        
        
        let time = 1499689288
        
        let transformed = changeUTCtoDate(UTCString: time)
        
        XCTAssert(transformed == "10/07")
        
    }
    
    
    
    func testWeatherDataModel() {
        
//        let jsonObject =
//        
//        }
        
//            ["icon":"clear-day", "time":1499695200, "temperatureMin":74.84, "temperatureMax":75.3, "summary":"Clear throughout the day.", "humidity":0.86, "pressure":1016.23 , "windSpeed":8.69 ]
    
    
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
