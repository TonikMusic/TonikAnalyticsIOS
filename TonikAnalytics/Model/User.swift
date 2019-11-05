//
//  User.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/10/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation


struct User: Codable {
    var userName: String?
    var email: String?
    var password: String?
    
    init(userName: String?, email: String?, password: String?) {
        self.userName = userName
        self.email = email
        self.password = password
    }
    
    init(email: String?, password: String?) {
        self.email = email
        self.password = password
    }
    
    func toAnyObject() -> [String : String] {
        let data = try! JSONEncoder().encode(self)
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        return json as! [String : String]
    }
}

