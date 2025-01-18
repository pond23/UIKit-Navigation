//
//  NavigationViewController1.swift
//  test2
//
//  Created by อมรฤทธิ์ ตั้งฤดี on 17/1/2568 BE.
//

import UIKit

class NavigationViewController1: UIViewController {
    
    // MARK: - Properties
    
    private let pushButton = UIButton(type: .system)
    private let popButton = UIButton(type: .system)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup Views
    
    private func setup() {
        view.backgroundColor = .systemGreen
        navigationItem.title = "NavigationViewController1"
        
        setupButtons()
        setupButtonConstraints()
    }
    
    private func setupButtons() {
        view.addSubview(pushButton)
        view.addSubview(popButton)
        configureButtonActions()
    }
    
    private func setupButtonConstraints() {
        pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popButton.topAnchor.constraint(equalToSystemSpacingBelow: pushButton.bottomAnchor, multiplier: 1).isActive = true
    }
    
    // MARK: - Actions
    
    @objc private func pushPressed() {
        let viewController = NavigationViewController2()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func popPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func configureButtonActions() {
        configureButton(pushButton, title: "Push", action: #selector(pushPressed))
        configureButton(popButton, title: "Pop", action: #selector(popPressed))
    }
    
    private func configureButton(_ button: UIButton, title: String, action: Selector) {
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        configuration.baseBackgroundColor = .systemBlue
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .primaryActionTriggered)
    }
}
