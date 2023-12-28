//
//  Circle.swift
//  CircleUT
//
//  Created by Jeff Terry on 3/23/20.
//  Copyright © 2020 Jeff Terry. All rights reserved.
//

import SwiftUI

@Observable class Circle: Ellipse {
    
    var radius = 0.0
    var radiusString = "1.0"
    
    
    /// initWithRadius initialized the Circle and Calculates Area and Perimeter
    /// - Parameter passedRadius: radius of the circle (units of length)
    func initWithRadius(passedRadius: Double) -> Bool {
        
        radius = passedRadius
        
        Task{
            
            await setButtonEnable(state: false)
            
            let returnedResults = await withTaskGroup(of: (Type: String, StringToDisplay: String, Value: Double).self, /* this is the return from the taskGroup*/
                                                      returning: [(Type: String, StringToDisplay: String, Value: Double)].self, /* this is the return from the result collation */
                                                      body: { taskGroup in  /*This is the body of the task*/
                
                // We can use `taskGroup` to spawn child tasks here.
                
                taskGroup.addTask { let areaResult = await self.calculateArea(majorAxis: self.radius, minorAxis: self.radius)
                    
                    return areaResult  /* this is the return from the taskGroup*/}
                
                taskGroup.addTask { let perimeterResult = await self.calculatePerimeter(majorAxis: self.radius, minorAxis: self.radius)
                    
                    return perimeterResult  /* this is the return from the taskGroup*/}
                
                
                // Collate the results of all child tasks
                var combinedTaskResults :[(Type: String, StringToDisplay: String, Value: Double)] = []
                for await result in taskGroup {
                    
                    combinedTaskResults.append(result)
                }
                
                return combinedTaskResults  /* this is the return from the result collation */
                
            })
            
            //Do whatever processing that you need with the returned results of all of the child tasks here.
            
            // Sort the results based upon of the result so that the Area returns first
            
            let sortedCombinedResults = returnedResults.sorted(by: { $0.0 < $1.0 })
            
            print(returnedResults)
            print(sortedCombinedResults)
            
            await setButtonEnable(state: true)
            
        }


       

        
        return true
        
        
    }
    
    /// calculatePerimeter
    /// - Parameters:
    ///   - majorAxis: radius of the circle (unit length)
    ///   - minorAxis: radius of the circle (unit length)
        override func calculatePerimeter(majorAxis: Double, minorAxis: Double) async -> (Type: String, StringToDisplay: String, Value: Double) {
        
        //perimeter = 2 * pi * radius
        //perimeter = pi * (majorAxis + minorAxis)
            
        let randomSleep = UInt32(Int.random(in: 1...5))
        sleep(randomSleep)
        
        let calculatedPerimeter = Double.pi * (majorAxis + minorAxis)
        let newPerimeterText = String(format: "%7.5f", calculatedPerimeter)
            
            print(newPerimeterText)
        
        await updatePerimeter(perimeterTextString: newPerimeterText)
        await newPerimeterValue(perimeterValue: calculatedPerimeter)
        
        
            return (Type: "Circle Perimeter", StringToDisplay: newPerimeterText, Value: calculatedPerimeter)
        
    }
    

}
