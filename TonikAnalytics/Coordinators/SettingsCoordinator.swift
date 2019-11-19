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
        case loginSignUp
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
        switch destination {
        case .email:
            let vc = makeViewController(for: destination)
            self.navController.pushViewController(vc, animated: true)
        case .updatePassword:
            let vc = makeViewController(for: destination)
            self.navController.pushViewController(vc, animated: true)
        case .privacyPolicy:
            let vc = makeViewController(for: destination)
            self.navController.pushViewController(vc, animated: true)
        case .subscription:
            let vc = makeViewController(for: destination)
            self.navController.pushViewController(vc, animated: true)
        case .helpAndSupport:
            let vc = makeViewController(for: destination)
            self.navController.pushViewController(vc, animated: true)
        case .terms:
            let vc = makeViewController(for: destination)
            self.navController.pushViewController(vc, animated: true)
        case .loginSignUp:
            let vc = makeViewController(for: destination)
            vc.modalPresentationStyle = .fullScreen
            self.navController.present(vc, animated: true, completion: nil)
        }
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
        case .loginSignUp:
            return LoginSignupViewController()
        }
    }
}



