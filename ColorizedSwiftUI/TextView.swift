//
//  TextView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Boev on 13.12.2022.
//

import SwiftUI

struct TextView: View {
    
    let value: Double
    
    var body: some View {
        Text(value.formatted())
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextView(value: 100.0)
        }
    }
}
