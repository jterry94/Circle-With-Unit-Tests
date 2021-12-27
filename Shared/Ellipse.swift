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
    @Published var enableButton = true
    
    /// initWithAxis Initialized the Ellipse and Calculated Area and the Perimeter
    /// - Parameters:
    ///   - majorAxis: majorAxis of the Ellipse (units of length)
    ///   - minorAxis: minorAxis of the Ellipse (units of length)
    func initWithAxis(majorAxis: Double, minorAxis: Double) async -> Bool {
        
        semiMajorAxisLength = majorAxis
        semiMinorAxisLength = minorAxis
        
        Task{
            
            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
        
            
                taskGroup.addTask { await self.calculateArea(majorAxis: self.semiMajorAxisLength, minorAxis: self.semiMinorAxisLength)}
                taskGroup.addTask { await self.calculatePerimeter(majorAxis: self.semiMajorAxisLength, minorAxis: self.semiMinorAxisLength)}
            
        }
            
            await setButtonEnable(state: true)
                                                 
        }
        

        return true
        
    }
    
    
    /// calculateArea
    /// - Parameters:
    ///   - majorAxis: majorAxis of the Ellipse (units of length)
    ///   - minorAxis: minorAxis of the Ellipse (units of length)
    func calculateArea(majorAxis: Double, minorAxis: Double) async {
        
        //Area = pi * majorAxis * minorAxis
        
        let calculatedArea = Double.pi * majorAxis * minorAxis
        let newAreaText = String(format: "%7.5f", calculatedArea)
        
        await updateArea(areaTextString: newAreaText)
        await newAreaValue(areaValue: calculatedArea)
        
        return
        
        
    }
    
    /// setButton Enable
    /// Toggles the state of the Enable Button on the Main Thread
    /// - Parameter state: Boolean describing whether the button should be enabled.
    @MainActor func setButtonEnable(state: Bool){
        
        
        if state {
            
            Task.init {
                await MainActor.run {
                    
                    
                    self.enableButton = true
                }
            }
            
            
                
        }
        else{
            
            Task.init {
                await MainActor.run {
                    
                    
                    self.enableButton = false
                }
            }
                
        }
        
    }
    
    /// updateArea
    /// Executes on the main thread
    /// - Parameter areaTextString: Text describing the value of the area
    @MainActor func updateArea(areaTextString: String){
        
        areaText = areaTextString
        
    }
    
    @MainActor func newAreaValue(areaValue: Double){
        
        self.area = areaValue
        
    }
    
    @MainActor func newPerimeterValue(perimeterValue: Double){
        
        self.perimeter = perimeterValue
        
    }
    
    /// updatePerimeter
    /// Executes on the main thread
    /// - Parameter perimeterTextString: Text describing the value of the perimeter
    @MainActor func updatePerimeter(perimeterTextString:String){
        
        perimeterText = perimeterTextString
        
        
    }

    
    
    /// calculatePerimeter
    /// - Parameters:
    ///   - majorAxis: majorAxis of the Ellipse (units of length)
    ///   - minorAxis: minorAxis of the Ellipse (units of length)
    func calculatePerimeter(majorAxis: Double, minorAxis: Double) async{
        
        //perimeter = pi(a+b)(1 + 1/4 h^2 + 1/64 h^4 + 1/256 h^6 + ....)
        // h = (majorAxis - minorAxis)/(majorAxis + minorAxis)
        
        let h = (majorAxis - minorAxis)/(majorAxis + minorAxis)
        
        let calculatedPerimeter = (1.0 + (1.0/4.0)*(pow(h, 2.0)) + (1.0/64.0)*(pow(h, 4.0)) + (1.0/256.0)*pow(h, 6.0))*(majorAxis + minorAxis)*Double.pi
        let newPerimeterText = String(format: "%7.5f", calculatedPerimeter)
        
        await updatePerimeter(perimeterTextString: newPerimeterText)
        await newPerimeterValue(perimeterValue: calculatedPerimeter)
        
        
    }
    
    

}
