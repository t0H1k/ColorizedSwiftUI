//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Boev on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSlider = Double.random(in: 0...255).rounded()
    @State private var greenSlider = Double.random(in: 0...255).rounded()
    @State private var blueSlider = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                ColorView(red: redSlider, green: greenSlider, blue: blueSlider)
                
                VStack {
                    SliderView(sliderValue: $redSlider, color: .red)
                    SliderView(sliderValue: $greenSlider, color: .green)
                    SliderView(sliderValue: $blueSlider, color: .blue)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
