//
//  TabBarViewController.swift
//  test2
//
//  Created by อมรฤทธิ์ ตั้งฤดี on 17/1/2568 BE.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Setup Methods
    private func setupTabBar() {
        navigationItem.title = "TabBar Container"
        viewControllers = createViewControllers()
    }
    
    private func createViewControllers() -> [UIViewController] {
        let firstViewController = createTabViewController(title: "Search", backgroundColor: .systemGreen, tabBarItem: .search)
        let secondViewController = createTabViewController(title: "More", backgroundColor: .systemBlue, tabBarItem: .more)
        
        return [firstViewController, secondViewController]
    }
    
    private func createTabViewController(title: String, backgroundColor: UIColor, tabBarItem: UITabBarItem.SystemItem) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = backgroundColor
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarItem, tag: 0)
        viewController.title = title
        return viewController
    }
}
