//
//  TrackedArtistsCoordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/13/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit


class TrackedArtistsCoordinator: DefaultCoordinator {
    
    //MARK: - Protocols Stubs & Preperties
    
    enum Destination {
        case analytics
    }
    
    var navController: UINavigationController!
    var viewController: TrackedArtistsViewController!
    // MARK: Init
    
    required init(navigationController: UINavigationController) {
        self.navController = navigationController
        self.viewController = TrackedArtistsViewController()
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
        case .analytics:
            return UIViewController()
        }
    }
    
    
}
