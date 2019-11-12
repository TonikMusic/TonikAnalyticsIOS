//
//  MainCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/4/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class AuthCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
//    var childCoordinators = [Coordinator]()
    let navController: UINavigationController
    let window: UIWindow

    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navController = navigationController
    }
    
    func start() {
        let vc = LoginSignupViewController()
        vc.coordinator = self
        navController.delegate = self
        navController.navigationBar.isHidden = true
        navController.viewControllers = [vc]
        window.rootViewController = navController
    }
}
