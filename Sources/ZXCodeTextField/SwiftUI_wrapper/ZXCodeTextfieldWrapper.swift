//
//  ZXCodeTextFieldWrapper.swift
//  keyboardTest
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import SwiftUI
import Combine

public struct ZXCodeTextFieldWrapper: UIViewRepresentable {
    
    public let numberOfSymbols: Int
    public let style: ZXCodeLabelStyle
    
    @Binding public var otpCode: String
    @Binding var viewModel: ZXCodeTextFieldViewModel

    // MARK: -
    
    public init(
        numberOfSymbols: Int,
        style: ZXCodeLabelStyle,
        otpCode: Binding<String>,
        viewModel: Binding<ZXCodeTextFieldViewModel>
    ) {
        self.numberOfSymbols = numberOfSymbols
        self.style = style
        self._otpCode = otpCode
        self._viewModel = viewModel
    }

    public func makeCoordinator() -> ZXCodeTextFieldCoordinator {
        return ZXCodeTextFieldCoordinator(self)
    }
    
    public func makeUIView(context: Context) -> ZXCodeTextField {
        let textField = ZXCodeTextField(numberOfSymbols: numberOfSymbols, style: style)
        viewModel.setTextField(textField)

        textField.addTarget(context.coordinator, action: #selector(ZXCodeTextFieldCoordinator.codeChanged(_:)), for: .editingChanged)
        
        return textField
    }

    public func updateUIView(_ uiView: ZXCodeTextField, context: Context) {
        uiView.code = otpCode
    }
    
    private func setupBinds() {
    }
}
