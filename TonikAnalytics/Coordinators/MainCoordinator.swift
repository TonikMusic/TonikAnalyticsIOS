//
//  MainCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/4/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    
    
    var childCoordinators = [Coordinator]()
    var navController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func startWithHome() {
        let vc = TabBarController()
        vc.selectedIndex = 0
        vc.coordinator = self
        navController.delegate = self
        navController.pushViewController(vc, animated: true)
    }
    
    func startWithLoginSignUp() {
        let vc = LoginSignupViewController()
        vc.coordinator = self
        navController.delegate = self
        navController.navigationBar.isHidden = true
        navController.pushViewController(vc, animated: true)
    }
}
