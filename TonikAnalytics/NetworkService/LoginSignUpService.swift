//
//  LoginSignUpService.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/8/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import Alamofire


enum NetworkingError: Error {
    case invalidInput
    case invalidEmailOrPassword
    
    var localizedDescription: String {
        switch self {
        case .invalidInput: return "invalid Input"
        case .invalidEmailOrPassword: return "invalid email or password"
        }
    }
}

enum EndPoint: String {
    case Login = "https://tonik-music.herokuapp.com/api/v0/artist/login"
    case Signup = "https://tonik-music.herokuapp.com/api/v0/artist/signup"
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class LoginSignUpService {
    
    typealias Handler = (Result<Data>)
    // NOTE: This method handles the request of a new user
    static func signUpRequest(newUser: User, completionHandler: @escaping (Handler) -> Void){
        
        AF.request(EndPoint.Signup.rawValue, method: .post, parameters: newUser,
            encoder: JSONParameterEncoder.default).response { response in
                // NOTE:
                guard response.error == nil else {
                    completionHandler(.failure(response.error!))
                    return
                }

                guard let responseData = response.data else {
                    print("didnt receive any data")
                    return
                }
                completionHandler(.success(responseData))
        }
    }
    
    // NOTE: This method handles the request of user login
    static func loginRequest(user: ReturningUser, completionHandler: @escaping (Handler) -> Void) {
        AF.request(EndPoint.Login.rawValue, method: .post, parameters: user,
                   encoder: JSONParameterEncoder.default).response { response in
                guard response.error == nil else {
                    completionHandler(.failure(response.error!))
                    return
                }
            
                    guard let responseData = response.data else {
                        print("did not receive any response")
                        return
                    }
                    completionHandler(.success(responseData))
        }
    }

}
