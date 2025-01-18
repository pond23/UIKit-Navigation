//
//  ModalNavigation.swift
//  test2
//
//  Created by อมรฤทธิ์ ตั้งฤดี on 17/1/2568 BE.
//

import UIKit

class ModalNavigation: UIViewController {
    
    // MARK: - UI Elements
    
    private let presentButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Present"
        configuration.baseBackgroundColor = .systemBlue
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup Methods
    
    private func setup() {
        view.backgroundColor = .systemRed
        navigationItem.title = "Modal"
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(presentButton)
        setupButtonConstraints()
        configureButtonActions()
    }
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureButtonActions() {
        presentButton.addTarget(self, action: #selector(presentPressed), for: .primaryActionTriggered)
    }
    
    // MARK: - Actions
    
    @objc private func presentPressed() {
        let viewController = ModalViewController1()
//        viewController.modalTransitionStyle = .flipHorizontal
//        viewController.modalPresentationStyle = .fullScreen
//        viewController.receivedData = "Hello from ModalNavigation"
        present(viewController, animated: true, completion: nil)
    }
}
