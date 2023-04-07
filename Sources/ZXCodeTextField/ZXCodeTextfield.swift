//
//  ZXCodeTextField.swift
//  keyboardTest
//
//  Created by Андрей Рыбалкин on 06.04.2023.
//

import Foundation
import UIKit

public final class ZXCodeTextField: UIControl {
    
    // MARK: -
        
    public var numberOfSymbols: Int
    public var style: ZXCodeLabelStyle?
    public var code: String { didSet { configureCodeLabels() } }
        
    // MARK: -

    private var chars: [ZXCodeLabel?] {
        return codeStackView.arrangedSubviews.map { $0 as? ZXCodeLabel }
    }
    
    private lazy var codeStackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    // MARK: -
    
   public init(numberOfSymbols: Int, style: ZXCodeLabelStyle? = nil) {
        self.numberOfSymbols = numberOfSymbols
        self.style = style
        
        self.code = ""
        
        super.init(frame: .zero)
        
        setupUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -

    private func setupUI() {
        
        (0..<numberOfSymbols).forEach { [weak self] _ in
            ( self?.codeStackView.addArrangedSubview(ZXCodeLabel(char: nil, style: style)))
        }
        
        addSubview(codeStackView)
        
        setupConstraints()
        setupStyle()
    }
    
    private func setupStyle() {
        codeStackView.spacing = style?.spacing ?? 16
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            codeStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: style?.padding ?? 16),
            codeStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(style?.padding ?? 16) ),
            codeStackView.topAnchor.constraint(equalTo: self.topAnchor),
            codeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureCodeLabels() {
        
        for index in 0..<numberOfSymbols {
            
            let char = chars[index]
            
            if index < code.count {
                char?.char = code[index]
            } else {
                char?.char = " "
            }
            
            setUnderlineColor(for: char, index: index)
        }
    }
    
    private func setUnderlineColor(for char: ZXCodeLabel?, index: Int) {
        if index == code.count {
            char?.underLineColor = style?.underLineCurrentColor
        } else {
            char?.underLineColor = style?.underLineNormalColor
        }
    }

    // MARK: -
    
    public func wrongPassAlarm() {
        chars.forEach { $0?.wrongPassAlarm(style?.errorColor) }
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
    
}

// MARK: -

extension ZXCodeTextField: UIKeyInput {
    public var hasText: Bool {
        return false
    }
    
    public func insertText(_ text: String) {
        
        guard text.count <= numberOfSymbols else { return }
        
        for char in text {
            
            guard char.isNumber || char.isLetter else { return }

            if code.count < numberOfSymbols {
                code += char.uppercased()
                
                sendActions(for: .editingChanged)
                
            }
        }
    }
    
    public func deleteBackward() {
        guard code.count >= 1 else { return }
        code.removeLast()
        sendActions(for: .editingChanged)
    }
    
    public override var canBecomeFirstResponder: Bool {
        return true
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        becomeFirstResponder()
        
        guard code.isEmpty else { return }
        (codeStackView.arrangedSubviews.first as? ZXCodeLabel)?.underLineColor = style?.underLineCurrentColor
    }
    
}

extension StringProtocol {
subscript(offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}

