//
//  Coordinator.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/4/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator: NSObject {
    var childCoordinators: [Coordinator] { get set }
    var navController: UINavigationController { get set }
    
    func startWithHome()
    func startWithLoginSignUp()
}

