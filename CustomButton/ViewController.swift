//
//  ViewController.swift
//  custom
//
//  Created by Guilherme Ramos on 18/10/20.
//  Copyright © 2020 Progeekt. All rights reserved.
//

import UIKit
import SwiftUI

final class ViewController: UIViewController {
    var primary = MyCustomButton(configuration: .primary)
    var secondary = MyCustomButton(configuration: .secondary)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(primary)
        view.addSubview(secondary)
        view.backgroundColor = .white

        primary.translatesAutoresizingMaskIntoConstraints = false
        primary.setTitle("Primary", for: [])

        secondary.translatesAutoresizingMaskIntoConstraints = false
        secondary.setTitle("Secondary", for: [])

        NSLayoutConstraint.activate([
            primary.leftAnchor.constraint(equalTo: primary.superview!.leftAnchor, constant: 20),
            primary.rightAnchor.constraint(equalTo: primary.superview!.rightAnchor, constant: -20),
            primary.centerYAnchor.constraint(equalTo: primary.superview!.centerYAnchor),
            primary.heightAnchor.constraint(equalToConstant: 50),
            secondary.leftAnchor.constraint(equalTo: secondary.superview!.leftAnchor, constant: 20),
            secondary.rightAnchor.constraint(equalTo: secondary.superview!.rightAnchor, constant: -20),
            secondary.topAnchor.constraint(equalTo: primary.bottomAnchor, constant: 20),
            secondary.heightAnchor.constraint(equalToConstant: 50)
        ])

        primary.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }

    @objc func toggle(_ sender: UIButton) {
        sender.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sender.isEnabled = true
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }

    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = UIViewController
        typealias ContainerContext = UIViewControllerRepresentableContext<ViewController_Previews.ContainerView>

        func makeUIViewController(context: ContainerContext) -> UIViewController {
            return ViewController()
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: ContainerContext) {}

    }
}
