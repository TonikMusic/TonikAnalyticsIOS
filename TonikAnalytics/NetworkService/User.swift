//
//  User.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/8/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation


struct User: Codable {
    let fullName: String
    let userName: String
    let email: String
    let password: String
    let dob: String
    let artist: Bool
    var dictionary: [Any] {
        return [["fullName": fullName,
                "email": email,
                "dob": dob,
                "password": password,
                "userName": userName,
                "artist": artist
                ]]
    }
}

struct ReturningUser: Codable {
    let email: String
    let password: String
}



