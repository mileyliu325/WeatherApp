//
//  MLWeatherAppUITests.swift
//  MLWeatherAppUITests
//
//  Created by Simeng Liu on 8/07/2017.
//  Copyright © 2017 Simeng Liu. All rights reserved.
//

import XCTest

class MLWeatherAppUITests: XCTestCase {
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        print("Start UI Test")
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         print("Stop UI Test")
        super.tearDown()
    }
    
    func TapCell() {

        let cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        
    }
    func backNavigationTap() {
    
        app.navigationBars["10/07"].buttons["MLWeatherApp"].tap()
        
    }
    
}
