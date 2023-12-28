//
//  ContentView.swift
//  Shared
//
//  Created by Jeff Terry on 11/28/20.
//

import SwiftUI
import Observation

struct ContentView: View {
    
    @Bindable private var circleModel = Circle()
    @State var radiusString = "1.0"
    
    var body: some View {
        
        VStack{
            Text("Radius")
                .padding(.top)
                .padding(.bottom, 0)
            TextField("Enter Radius", text: $radiusString, onCommit: {self.calculateCircle()})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            HStack {
                VStack{
            Text("Area")
                .padding(.bottom, 0)
            TextField("", text: $circleModel.areaText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
        }
        VStack{
            Text("Area")
                .padding(.bottom, 0)
            Text("\(circleModel.area, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            }
            }
            HStack{
                VStack{
            Text("Perimeter")
                .padding(.bottom, 0)
            TextField("", text: ( $circleModel.perimeterText))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                }
                VStack{
                    Text("Perimeter")
                        .padding(.bottom, 0)
                    Text("\(circleModel.perimeter, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                        
                    }

                
                
            }
            
            Button("Calculate", action: {self.calculateCircle()})
                .padding(.bottom)
                .padding()
                .disabled(circleModel.enableButton == false)
            
            
        }
        
    }
    
    func calculateCircle() {
        
        circleModel.enableButton = false
        
        
        let _ : Bool =  circleModel.initWithRadius(passedRadius: Double(radiusString)!)
        
        
    

}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
