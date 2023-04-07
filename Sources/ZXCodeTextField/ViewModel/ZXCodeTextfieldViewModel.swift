//
//  File.swift
//  
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import Foundation

public class ZXCodeTextFieldViewModel: ObservableObject {
    private(set)public var zxCodeTextField: ZXCodeTextField?
    
    // MARK: -

    public init() { }
    
    public func wrongPassAlarm() {
        zxCodeTextField?.wrongPassAlarm()
    }
    
    public func setTextField(_ textField: ZXCodeTextField) {
        zxCodeTextField = textField
    }
}

