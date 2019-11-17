//
//  TabBarCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit


class TabBarCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow!
    var viewController: TabBarController!
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
        self.viewController = TabBarController()
    }
    
    // MARK: - Methods
    
    func start() {
        self.viewController.coordinator = self
        self.viewController.selectedIndex = 0
        window.rootViewController = self.viewController
    }
}
