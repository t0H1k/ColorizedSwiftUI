//
//  TextFieldView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Boev on 13.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation {
                checkValue()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong", isPresented: $showAlert, actions: {}) {
            Text("Enter value from 0 to 255")
        }
    }
}

extension TextFieldView {
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        value = 0
        textValue = "0"
        showAlert.toggle()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textValue: .constant("100"), value: .constant(100))
    }
}
