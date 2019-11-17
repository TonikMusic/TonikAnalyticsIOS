//
//  SettingsCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/12/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit


class SettingsCoordinator: DefaultCoordinator {
    //MARK: - Protocols Stubs & Preperties
    
    enum Destination {
        case email
        case updatePassword
        case subscription
        case privacyPolicy
        case terms
        case helpAndSupport
    }
    
    var navController: UINavigationController!
    var viewController: SettingsTableViewController!
    
    // MARK: - Init
    
    required init(navigationController: UINavigationController) {
        self.navController = navigationController
        self.viewController = SettingsTableViewController()
    }
    
    // MARK: - Methods
    
    func start() {
        self.viewController.coordinator = self
        self.navController.viewControllers = [viewController]
    }
    
    func navigate(to destination: Destination) {
        let vc = makeViewController(for: destination)
        self.navController.pushViewController(vc, animated: true)
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .email:
            return UpdateEmailViewController()
        case .updatePassword:
            return ChangePasswordViewController()
        case .subscription:
            return ManageSubcriptionViewController()
        case .privacyPolicy:
            return PrivacyPolicyViewController()
        case .terms:
            return TermsViewController()
        case .helpAndSupport:
            return HelpAndSupportViewController()
        }
    }
}



