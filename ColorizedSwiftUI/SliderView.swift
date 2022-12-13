//
//  SliderView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Boev on 13.12.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    @State var textValue = ""
    
    var color: Color
    
    var body: some View {
        HStack {
            SliderLabelView(value: sliderValue)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: sliderValue) { value in
                    textValue = "\(lround(value))"
                }
            TextFieldView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            SliderView(sliderValue: .constant(100), color: .red)
        }
    }
}
