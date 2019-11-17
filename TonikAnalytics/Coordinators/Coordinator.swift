//
//  Coordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/4/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit



protocol Coordinator: class {
//    var childCoordinators: [Coordinator] { get set }
    func start()
}

protocol DefaultCoordinator: class {
    associatedtype Destination
    var navController: UINavigationController! { get }
    init(navigationController:UINavigationController) 
    
    func start()
    func navigate(to destination: Destination)
    func makeViewController(for destination: Destination) -> UIViewController
}

