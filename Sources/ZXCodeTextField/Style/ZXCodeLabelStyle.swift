//
//  ZXCodeLabelStyle.swift
//  keyboardTest
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import Foundation
import UIKit

public struct ZXCodeLabelStyle {
    
    // MARK: -

    public var underLineNormalColor: UIColor
    public var underLineCurrentColor: UIColor
    public var errorColor: UIColor
    public var textColor: UIColor
    
    public var font: UIFont
    
    public var lineHeight: CGFloat
    public var spacing: CGFloat?
    public var padding: CGFloat?

    // MARK: -

    public init(
        underLineNormalColor: UIColor = .black,
        underLineCurrentColor: UIColor = .green,
        errorColor: UIColor = .red,
        lineHeight: CGFloat = 2,
        font: UIFont = .systemFont(ofSize: 17, weight: .bold),
        textColor: UIColor = .blue,
        spacing: CGFloat? = nil,
        padding: CGFloat? = nil
    ) {
        self.underLineNormalColor = underLineNormalColor
        self.underLineCurrentColor = underLineCurrentColor
        self.errorColor = errorColor
        self.lineHeight = lineHeight
        self.font = font
        self.textColor = textColor
        self.spacing = spacing
        self.padding = padding
    }
}
