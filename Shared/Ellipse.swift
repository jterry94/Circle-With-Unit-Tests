//
//  Ellipse.swift
//  CircleUT
//
//  Created by Jeff Terry on 3/23/20.
//  Copyright © 2020 Jeff Terry. All rights reserved.
//

import SwiftUI

class Ellipse: NSObject, ObservableObject {
    
    
    var semiMajorAxisLength = 0.0
    var semiMinorAxisLength = 0.0
    var centerOfAnEllipse = (x:0.0, y:0.0)
    @Published var area = 0.0
    @Published var perimeter = 0.0
    @Published var perimeterText = ""
    @Published var areaText = ""
    
    /// initWithAxis Initialized the Ellipse and Calculated Area and the Perimeter
    /// - Parameters:
    ///   - majorAxis: majorAxis of the Ellipse (units of length)
    ///   - minorAxis: minorAxis of the Ellipse (units of length)
    func initWithAxis(majorAxis: Double, minorAxis: Double) -> Bool {
        
        semiMajorAxisLength = majorAxis
        semiMinorAxisLength = minorAxis
        
        calculateArea(majorAxis: semiMajorAxisLength, minorAxis: semiMinorAxisLength)
        calculatePerimeter(majorAxis: semiMajorAxisLength, minorAxis: semiMinorAxisLength)
        
        return true
        
    }
    
    
    /// calculateArea
    /// - Parameters:
    ///   - majorAxis: majorAxis of the Ellipse (units of length)
    ///   - minorAxis: minorAxis of the Ellipse (units of length)
    func calculateArea(majorAxis: Double, minorAxis: Double){
        
        //Area = pi * majorAxis * minorAxis
        
        area = Double.pi * majorAxis * minorAxis
        areaText = String(format: "%7.5f", area)
        
        return
        
        
    }
    
    /// calculatePerimeter
    /// - Parameters:
    ///   - majorAxis: majorAxis of the Ellipse (units of length)
    ///   - minorAxis: minorAxis of the Ellipse (units of length)
    func calculatePerimeter(majorAxis: Double, minorAxis: Double){
        
        //perimeter = pi(a+b)(1 + 1/4 h^2 + 1/64 h^4 + 1/256 h^6 + ....)
        // h = (majorAxis - minorAxis)/(majorAxis + minorAxis)
        
        let h = (majorAxis - minorAxis)/(majorAxis + minorAxis)
        
        perimeter = (1.0 + (1.0/4.0)*(pow(h, 2.0)) + (1.0/64.0)*(pow(h, 4.0)) + (1.0/256.0)*pow(h, 6.0))*(majorAxis + minorAxis)*Double.pi
        perimeterText = String(format: "%7.5f", perimeter)
        
        
    }
    
    

}
