//
//  SettingsSection.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/1/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
    var containsArrow: Bool { get }
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
        case .manageSubscription: return "Manage subscription"
        }
    }
}


enum OtherOptions: Int, CaseIterable, CustomStringConvertible, SectionType {
    case privacyPolicy
    case terms
    case helpAndFeedback
    
    var containsSwitch: Bool { return false }
    var containsArrow: Bool { return true }
    
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
