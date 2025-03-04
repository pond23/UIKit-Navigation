//
//  ModalViewController2.swift
//  test2
//
//  Created by อมรฤทธิ์ ตั้งฤดี on 17/1/2568 BE.
//

import UIKit

class ModalViewController2: UIViewController {
    
    // MARK: - Properties
    
    var receivedData: String?
    
    // MARK: - UI Elements
    
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
        if let data = receivedData {
            print("Received data: \(data)")
        }
        setup()
    }
    
    // MARK: - Setup Methods
    
    private func setup() {
        view.backgroundColor = .systemPurple
        navigationItem.title = "PresentViewController2"
        
        setupButton()
        setupButtonConstraints()
    }
    
    private func setupButton() {
        view.addSubview(dismissButton)
        configureButtonActions()
    }
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureButtonActions() {
        dismissButton.addTarget(self, action: #selector(dismissPressed), for: .primaryActionTriggered)
    }
    
    // MARK: - Actions
    
    @objc private func dismissPressed() {
        dismiss(animated: true, completion: nil)
    }
}
