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
        setup()
    }
    
    // MARK: - Setup Methods
    
    private func setup() {
        navigationItem.title = "TabBar Container"
        viewControllers = createViewControllers()
    }
    
    private func createViewControllers() -> [UIViewController] {
        let firstViewController = createTabViewController(title: "Bookmarks", backgroundColor: .systemGreen, tabBarItem: .bookmarks)
        let secondViewController = createTabViewController(title: "Top Rated", backgroundColor: .systemPurple, tabBarItem: .topRated)
        let thirdViewController = createTabViewController(title: "History", backgroundColor: .systemRed, tabBarItem: .history)

        return [firstViewController, secondViewController, thirdViewController]
    }
    
    private func createTabViewController(title: String, backgroundColor: UIColor, tabBarItem: UITabBarItem.SystemItem) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = backgroundColor
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarItem, tag: 0)
        viewController.title = title
        return viewController
    }
}
