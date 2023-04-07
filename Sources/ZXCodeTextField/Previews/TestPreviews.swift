//
//  TestPreviews.swift
//  keyboardTest
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import SwiftUI

struct SwiftUIWrapper: View {
    
    let style = ZXCodeLabelStyle(underLineNormalColor: .white, underLineCurrentColor: .green, errorColor: .red, lineHeight: 2, font: .systemFont(ofSize: 24, weight: .bold), textColor: .white, spacing: 16, padding: 32)
    
    @State var insCode: String = ""
    @State var textFieldViewModel = ZXCodeTextFieldViewModel()

    var body: some View {
        VStack {
            Text("Enter your OTP")
            Text("Your code: \(insCode)")

            ZXCodeTextFieldWrapper(numberOfSymbols: 6, style: style, otpCode: $insCode, viewModel: $textFieldViewModel)
                .frame(height: 50)
            
            Button("WARNING!") {
                textFieldViewModel.wrongPassAlarm()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            Spacer()
        }
    }
}

struct SwiftUIWrapper_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIWrapper()
    }
}
