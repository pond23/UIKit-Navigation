//
//  ModalViewController1.swift
//  test2
//
//  Created by อมรฤทธิ์ ตั้งฤดี on 17/1/2568 BE.
//

import UIKit

class ModalViewController1: UIViewController {
    
    // MARK: - Properties
    
//    var receivedData: String?
    
    // MARK: - UI Elements
    
    private let presentButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Present another"
        configuration.baseBackgroundColor = .systemBlue
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Dismiss"
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
//        if let data = receivedData {
//            print("Received data: \(data)")
//        }
        setup()
    }
    
    // MARK: - Setup Methods
    
    private func setup() {
        view.backgroundColor = .systemGreen
        navigationItem.title = "PresentViewController1"
        setupButtons()
        setupButtonConstraints()
    }
    
    private func setupButtons() {
        view.addSubview(presentButton)
        view.addSubview(dismissButton)
        configureButtonActions()
    }
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalToSystemSpacingBelow: presentButton.bottomAnchor, multiplier: 1)
        ])
    }
    
    private func configureButtonActions() {
        presentButton.addTarget(self, action: #selector(presentPressed), for: .primaryActionTriggered)
        dismissButton.addTarget(self, action: #selector(dismissPressed), for: .primaryActionTriggered)
    }
    
    // MARK: - Actions
    
    @objc private func presentPressed() {
        let viewController = ModalViewController2()
        present(viewController, animated: true, completion: nil)
    }
    
    @objc private func dismissPressed() {
        dismiss(animated: true, completion: nil)
    }
}
