//
//  SliderLabelView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Boev on 13.12.2022.
//

import SwiftUI

struct SliderLabelView: View {
    @State var value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 50, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct SliderLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SliderLabelView(value: 100)
    }
}
