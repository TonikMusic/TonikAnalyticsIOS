//
//  AlertService.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit


struct AlertService {
    static func setupAlert(alertTitle: String,
                      alertMessage: String,
                      alertStyle: UIAlertController.Style,
                      actionTitle: String,
                      actionStyle: UIAlertAction.Style) -> UIAlertController {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: nil)
        alert.addAction(action)
        return alert
    }
}
