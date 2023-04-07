//
//  ZXCodeLabel.swift
//  keyboardTest
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import Foundation
import UIKit

internal final class ZXCodeLabel: UIView {
    
    // MARK: -
    
    internal var char: Character? { didSet { codeLabel.text = char?.uppercased() } }
    internal var underLineColor: UIColor? { didSet { underLine.backgroundColor = underLineColor } }
    
    // MARK: -

    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var underLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .black
        return line
    }()
    
    private lazy var codeStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    // MARK: -

    internal init (char: Character?, style: ZXCodeLabelStyle?) {
        self.char = char
        super.init(frame: .zero)
        setupUI()
        setupStyle(style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: -

    private func setupUI() {
        
        self.backgroundColor = .clear
        
        codeLabel.text = char?.uppercased()
        
        codeStack.addArrangedSubview(codeLabel)
        codeStack.addArrangedSubview(underLine)
        
        addSubview(codeStack)

        setupConstraints()
        
    }
    
    private func setupStyle(_ style: ZXCodeLabelStyle?) {
        codeLabel.font = style?.font
        codeLabel.textColor = style?.textColor
        underLine.backgroundColor = style?.underLineNormalColor
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            codeStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            codeStack.topAnchor.constraint(equalTo: self.topAnchor),
            codeStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            codeStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            underLine.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    // MARK: -

    internal func wrongPassAlarm(_ errorColor: UIColor? = nil) {
        
        let charOriginalColor = codeLabel.textColor
        let lineOriginalColor = underLine.backgroundColor

        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.075
        shakeAnimation.repeatCount = 2
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: codeLabel.center.x - 5, y: codeLabel.center.y)
        shakeAnimation.toValue = CGPoint(x: codeLabel.center.x + 5, y: codeLabel.center.y)
        codeLabel.layer.add(shakeAnimation, forKey: "position")
        
        
        codeLabel.textColor = errorColor ?? UIColor.red
        underLine.backgroundColor = errorColor ?? UIColor.red
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.35) { [weak self] in
            self?.codeLabel.textColor = charOriginalColor
            self?.underLine.backgroundColor = lineOriginalColor
        }
    }
    
}

