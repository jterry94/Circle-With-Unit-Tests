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
    func initWithRadius(passedRadius: Double) async -> Bool {
        
        radius = passedRadius
        
        Task{

            let _ = await withTaskGroup(of:  Void.self) { taskGroup in



                taskGroup.addTask { await self.calculateArea(majorAxis: self.radius, minorAxis: self.radius)}
                taskGroup.addTask { await self.calculatePerimeter(majorAxis: self.radius, minorAxis: self.radius)}

        }

            await setButtonEnable(state: true)


        }

        
        return true
        
        
    }
    
    /// calculatePerimeter
    /// - Parameters:
    ///   - majorAxis: radius of the circle (unit length)
    ///   - minorAxis: radius of the circle (unit length)
    override func calculatePerimeter(majorAxis: Double, minorAxis: Double) async{
        
        //perimeter = 2 * pi * radius
        //perimeter = pi * (majorAxis + minorAxis)
        
        let calculatedPerimeter = Double.pi * (majorAxis + minorAxis)
        let newPerimeterText = String(format: "%7.5f", calculatedPerimeter)
        
        await updatePerimeter(perimeterTextString: newPerimeterText)
        await newPerimeterValue(perimeterValue: calculatedPerimeter)
        
        
        return
        
    }
    

}
