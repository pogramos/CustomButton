//
//  CustomButton.swift
//  custom
//
//  Created by Guilherme Ramos on 18/10/20.
//  Copyright © 2020 Progeekt. All rights reserved.
//

import UIKit

enum ButtonStyle {
    case primary
    case secondary

    var font: UIFont {
        switch self {
        case .primary:
            return .systemFont(ofSize: 13, weight: .bold)
        case .secondary:
            return .systemFont(ofSize: 13)
        }
    }

    var enabledTextColor: UIColor {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .systemBlue
        }
    }

    var enabledBackgroundColor: UIColor {
        switch self {
        case .primary:
            return .systemBlue
        case .secondary:
            return .clear
        }
    }

    var disabledBackgroundColor: UIColor {
        switch self {
        case .primary:
            return .systemGray4
        case .secondary:
            return .clear
        }
    }

    var disabledTextColor: UIColor {
        switch self {
        case .primary:
            return .systemGray
        case .secondary:
            return .systemGray
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .primary:
            return 0
        case .secondary:
            return 1
        }
    }

    var borderColor: UIColor {
        switch self {
        case .primary:
            return .clear
        case .secondary:
            return .systemBlue
        }
    }

    var cornerRadius: CGFloat {
        return 12
    }
}

final class MyCustomButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            updateBackground()
        }
    }

    var style: ButtonStyle {
        didSet {
            apply(style: style)
        }
    }

    init(style: ButtonStyle = .primary) {
        self.style = style
        super.init(frame: .zero)
        apply(style: style)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func apply(style: ButtonStyle) {
        titleLabel?.font = style.font
        setTitleColor(style.enabledTextColor, for: .normal)
        setTitleColor(style.disabledTextColor, for: .disabled)

        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor.cgColor
        layer.cornerRadius = style.cornerRadius

        updateBackground()
    }

    private func updateBackground() {
        if isEnabled {
            backgroundColor = style.enabledBackgroundColor
        } else {
            backgroundColor = style.disabledBackgroundColor
        }
    }
}
