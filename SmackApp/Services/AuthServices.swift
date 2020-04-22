//
//  AuthServices.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/21/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import Foundation
import Alamofire
class AuthServices {
    static let instance = AuthServices()
    // few variables to save user's details like he is logged in or logout
    let defaults = UserDefaults.standard
    var isLoggedIn: Bool {
    get {
        return defaults.bool(forKey: LOGGED_IN_KEY)
    }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
}
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail:String{
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            return defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    func registerUser(email:String, password: String, Completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        let header = ["content-Type": "application/JSON; Charset = UTF-8"]
        
        let body: [String: Any] = ["email": lowerCaseEmail,
                                    "password": password]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                Completion(true)
            } else {
                Completion(false)
                debugPrint(response.result.error as Any)
            }
        }
       
}

}
