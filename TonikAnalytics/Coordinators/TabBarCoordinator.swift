//
//  TabBarCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit


class TabBarCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.selectedIndex = 0
        window.rootViewController = tabBarController
    }
}
