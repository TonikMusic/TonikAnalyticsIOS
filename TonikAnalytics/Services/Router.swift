//
//  Router.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/24/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation


enum Router: String {
    case login
    case signUp
    
    var method: String {
        switch self {
        case .login, .signUp:
            return "POST"
        }
    }
    
    
    func url() -> URL {
        switch self {
        case .login:
            return URL(string: "https://tonik-music.herokuapp.com/api/v0/artist/login")!
        case .signUp:
            return URL(string: "https://tonik-music.herokuapp.com/api/v0/artist/signup")!
        
        }
    }
}
