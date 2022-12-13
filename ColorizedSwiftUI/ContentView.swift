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
                .onTapGesture {
                    focusedField = nil
                }
            
            VStack(spacing: 40) {
                ColorView(red: redSlider, green: greenSlider, blue: blueSlider)
                
                VStack {
                    SliderView(sliderValue: $redSlider, color: .red)
                        .focused($focusedField, equals: .red)
                    SliderView(sliderValue: $greenSlider, color: .green)
                        .focused($focusedField, equals: .green)
                    SliderView(sliderValue: $blueSlider, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ContentView {
    
    private enum Field {
        case red
        case green
        case blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
