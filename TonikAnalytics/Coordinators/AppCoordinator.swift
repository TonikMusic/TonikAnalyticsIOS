//
//  AppCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow!
    let userDefault = UserDefaults.standard
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        if userDefault.bool(forKey: "isUserLoggedIn") {
            showTabBar()
        } else {
            showAuth()
        }
    }
    
    func showTabBar() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
    
    func showAuth() {
        let nav = UINavigationController()
        let authCoordinator = AuthCoordinator(window: window, navigationController: nav)
        authCoordinator.start()
    }
}
