//
//  MainCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/4/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class AuthCoordinator: NSObject, Coordinator {
    //MARK: - Protocols Stubs & Preperties
    
    let window: UIWindow!
    var childCoordinators = [Coordinator]()
    var navController: UINavigationController!
    var viewController: LoginSignupViewController!
    

    // MARK: - Init
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navController = navigationController
        self.viewController = LoginSignupViewController()
    }
    
    // MARK: - Methods
    
    func start() {
        self.viewController.coordinator = self
        self.navController.navigationBar.isHidden = true
        window.rootViewController = self.navController
    }
}
