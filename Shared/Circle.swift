//
//  Circle.swift
//  CircleUT
//
//  Created by Jeff Terry on 3/23/20.
//  Copyright © 2020 Jeff Terry. All rights reserved.
//

import SwiftUI

class Circle: Ellipse {
    
    var radius = 0.0
    @Published var radiusString = "1.0"
    
    /// initWithRadius initialized the Circle and Calculates Area and Perimeter
    /// - Parameter passedRadius: radius of the circle (units of length)
    func initWithRadius(passedRadius: Double) -> Bool {
        
        radius = passedRadius
    
        calculateArea(majorAxis: radius, minorAxis: radius)
        calculatePerimeter(majorAxis: radius, minorAxis: radius)
        
        return true
        
        
    }
    
    /// calculatePerimeter
    /// - Parameters:
    ///   - majorAxis: radius of the circle (unit length)
    ///   - minorAxis: radius of the circle (unit length)
    override func calculatePerimeter(majorAxis: Double, minorAxis: Double) {
        
        //perimeter = 2 * pi * radius
        //perimeter = pi * (majorAxis + minorAxis)
        
        perimeter = Double.pi * (majorAxis + minorAxis)
        perimeterText = String(format: "%7.5f", perimeter)
        
        
        return
        
    }
    

}
