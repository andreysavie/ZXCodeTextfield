//
//  ZXCodeTextFieldCoordinator.swift
//  keyboardTest
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import Foundation
import UIKit

public final class ZXCodeTextFieldCoordinator: NSObject {
    
    private var parent: ZXCodeTextFieldWrapper
    
    internal init(_ parent: ZXCodeTextFieldWrapper) {
        self.parent = parent
    }
    
    @objc internal func codeChanged(_ sender: ZXCodeTextField) {
        parent.otpCode = sender.code
    }
}
