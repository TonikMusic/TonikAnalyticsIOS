//
//  LoginSignUpService.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/10/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import Alamofire


struct NetworkService {
    
    // NOTE: This method handles the request of a new user
    static func signUpRequest(newUser: User, completion: @escaping (Result<[String:Any], Error>) -> Void){
        
        AF.request(Router.signUp.url(),
                   method: .post,
                   parameters: newUser.toAnyObject(),
                   encoding: JSONEncoding.default,
                   headers: nil,
                   interceptor: nil).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value as [String : Any]):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    default:
                        fatalError("received non-dictionary JSON response")
                    }
        
        }
    }

    
    // NOTE: This method handles the request of user login
    static func loginRequest(user: User, completion: @escaping (Result<[String:Any], Error>) -> Void) {
        AF.request(Router.login.url(),
                   method: .post,
                   parameters: user.toAnyObject(),
                   encoding: JSONEncoding.default).responseJSON { response in
                    switch response.result {
                    case .success(let value as [String : Any]):
                       completion(.success(value))
                    case .failure(let error):
                       completion(.failure(error))
                    default:
                       fatalError("received non-dictionary JSON response")
                    }
        }
    }

}
