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
        
        // เป็นการเพิ่ม target ให้กับปุ่ม (presentButton) เพื่อให้สามารถตอบสนองต่อการกระทำ (action) ของผู้ใช้ เช่น การกดปุ่ม  โดยมีพารามิเตอร์ 3 ตัว ดังนี้
        
        // target: Any?
        // เป็นตัวแปรที่ระบุว่า ใคร (หรือ อะไร) ที่จะรับการแจ้งเตือน (callback) เมื่อเกิดเหตุการณ์นี้
        
        // action: Selector
        // เป็นการระบุ เมธอด ที่จะถูกเรียกใช้เมื่อเกิดเหตุการณ์ที่กำหนด
        
        // for: UIControl.Event
        // ระบุ เหตุการณ์ ที่จะทำให้เมธอดใน action ถูกเรียก
    }
    
    // MARK: - Actions
    
    @objc private func presentPressed() {
        let viewController = ModalViewController1()
//        viewController.modalTransitionStyle = .flipHorizontal
        
        // modalTransitionStyle
        // กำหนด ประเภทของอนิเมชั่น ที่จะใช้เมื่อ view controller ใหม่ถูกแสดง (presented) หรือถูกปิด (dismissed).
        
//        viewController.modalPresentationStyle = .fullScreen
        
        // modalPresentationStyle
        // กำหนด ลักษณะการแสดง (presentation style) ของ view controller เมื่อมันถูกนำเสนอ (presented).
        
//        viewController.receivedData = "Hello from ModalNavigation"
        present(viewController, animated: true, completion: nil)
    }
}
