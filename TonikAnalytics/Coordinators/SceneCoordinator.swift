//
//  AppCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit

class SceneCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow!
    let userDefault = UserDefaults.standard
    
    // MARK: - init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Methods
    
    func start() {
//        userDefault.set(true, forKey: "isUserLoggedIn")
//        userDefault.synchronize()
        if userDefault.object(forKey: "isUserLoggedIn") != nil {
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
