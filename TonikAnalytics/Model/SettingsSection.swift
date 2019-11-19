//
//  SettingsSection.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/1/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
    var containsArrow: Bool { get }
    var switchIsOn: Bool { get }
}


enum Point {
    case topLeft
    case centerLeft
    case bottomLeft
    case topCenter
    case center
    case bottomCenter
    case topRight
    case centerRight
    case bottomRight
    
    var point: CGPoint {
        switch self {
        case .topLeft:
            return CGPoint(x: 0, y: 0)
        case .centerLeft:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeft:
            return CGPoint(x: 0, y: 1.0)
        case .topCenter:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottomCenter:
            return CGPoint(x: 0.5, y: 1.0)
        case .topRight:
            return CGPoint(x: 1.0, y: 0.0)
        case .centerRight:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomRight:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Account
    case Other
    
    var description: String {
        switch self {
        case .Account: return "ACCOUNT"
        case .Other: return "OTHER"
        }
    }
}


enum AccountOptions: Int, CaseIterable, CustomStringConvertible, SectionType {
    case darkMode
    case notification
    case updateEmail
    case changePassword
    case manageSubscription

    var containsArrow: Bool {
        switch self {
        case .darkMode: return false
        case .notification: return false
        case .updateEmail: return true
        case .changePassword: return true
        case .manageSubscription: return true
        }
    }
    
    var containsSwitch: Bool {
        switch self {
        case .darkMode: return true
        case .notification: return true
        case .updateEmail: return false
        case .changePassword: return false
        case .manageSubscription: return false
        }
    }
    
    var switchIsOn: Bool {
        switch self {
        case .darkMode, .notification: return true
        case .updateEmail, .changePassword, .manageSubscription: return false
        }
    }
    
    var description: String {
        switch self {
        case .darkMode: return "Dark Mode"
        case .notification: return "Notification"
        case .updateEmail: return "Update Email"
        case .changePassword: return "Change Password"
        case .manageSubscription: return "Manage Subscription"
        }
    }
}

enum AccountOptionsIcon: Int, CaseIterable, CustomStringConvertible {
    case darkMode
    case notification
    case updateEmail
    case changePassword
    case manageSubscription
    
    var description: String {
        switch self {
        case .darkMode: return "darkMode"
        case .notification: return "notification"
        case .updateEmail: return "email"
        case .changePassword: return "password"
        case .manageSubscription: return "subcription"
        }
    }
}


enum OtherOptions: Int, CaseIterable, CustomStringConvertible, SectionType {
    case privacyPolicy
    case terms
    case helpAndFeedback
    
    var containsSwitch: Bool { return false }
    var containsArrow: Bool { return true }
    var switchIsOn: Bool { return false }
    
     var description: String {
         switch self {
         case .privacyPolicy: return "Privacy Policy"
         case .terms: return "Terms"
         case .helpAndFeedback: return "Help & Feedback"
         }
     }
 }


enum OtherOptionsIcon: Int, CaseIterable, CustomStringConvertible {
    case privacyPolicy
    case terms
    case helpAndFeedback
    
    var description: String {
        switch self {
        case .privacyPolicy: return "privacy"
        case .terms: return "term"
        case .helpAndFeedback: return "feedback"
        }
    }
}
