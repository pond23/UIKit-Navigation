//
//  AppDelegate.swift
//  test2
//
//  Created by อมรฤทธิ์ ตั้งฤดี on 13/6/2567 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tableViewController = UITableViewController(style: .plain)
        tableViewController.tableView.dataSource = self
        tableViewController.tableView.delegate = self
        
        let navigationController = UINavigationController(rootViewController: tableViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension AppDelegate: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let options = ["Modal", "Navigation", "TabBar", "Page"]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = options[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVC: UIViewController
        
        switch indexPath.row {
        case 0:
            selectedVC = ModalNavigation()
        case 1:
            selectedVC = NavigationViewController1()
        case 2:
            selectedVC = TabBarViewController()
        case 3:
            selectedVC = PageViewController()
        default:
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        if let navigationController = tableView.window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(selectedVC, animated: true)
        }
    }
}
