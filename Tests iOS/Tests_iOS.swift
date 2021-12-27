//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Jeff Terry on 11/28/20.
//

import XCTest
import Foundation
import SwiftUI

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCircleArea() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let myCircle = Circle()
        
        let radius = 1.0
        
        let area = await myCircle.calculateArea(majorAxis: radius, minorAxis: radius)
        
        XCTAssertEqual(area, Double.pi, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
    }
    
    func testCirclePerimeter() async {
        
        let myCircle = Circle()
        
        let radius = 1.0
        
        let perimeter = await myCircle.calculatePerimeter(majorAxis: radius, minorAxis: radius)
        
        
        XCTAssertEqual(perimeter, 2.0*Double.pi, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
        
    }
    
    
    func testEllipseArea() async {
        
        let myEllipse = Ellipse()
        
        let majorAxis = 3.0
        let minorAxis = 2.0
        
        let area = await myEllipse.calculateArea(majorAxis: majorAxis, minorAxis: minorAxis)
        
        XCTAssertEqual(area, 6.0*Double.pi, accuracy: 1.0E-7,"Was not equal to the resolution.")
        
        
    }
    
    
     func testEllipsePerimeter() async {
            
        let myEllipse = Ellipse()
                
        let majorAxis = 3.0
        let minorAxis = 2.0
                
        let perimeter = await myEllipse.calculatePerimeter(majorAxis: majorAxis, minorAxis: minorAxis)
                
        XCTAssertEqual(perimeter, 15.865439526701, accuracy: 1.0E-7, "Was not equal to the resolution." )
                
        }
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
