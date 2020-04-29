//
//  AuthServices.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/21/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
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
        //let header = ["content-Type": "application/JSON; Charset = UTF-8"]
        
        let body: [String: Any] = ["email": lowerCaseEmail,
                                    "password": password]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                Completion(true)
                print("under register user if condition")
            } else {
                Completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
        func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
            let lowerCaseEmail = email.lowercased()
            let body: [String: Any] = [
                "email": lowerCaseEmail,
            "password": password
            ]
            Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
                { (response) in
                if response.result.error == nil{
                    print("No error")
                    //let json = try! JSON(data: data)
                    // with normal way of using json
                   // if let json = try! (response.result.value as? Dictionary<String, Any>) {
                      //  if let email = json["user"] as? String{
                       //     self.userEmail = email
                      //      print(email)
                     //   }
                      //  if let token = json["token"] as? String {
                         //   self.authToken = token
                         //   print(token)
                    
                      //  }
                   // }
                    // using swiftyJSON
                    guard let data = response.data else { return }
                    let json =  try! JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    self.isLoggedIn = true
                    completion(true)
                    
            
                }
                else {
                    completion(false)
                    print("hi error")
                    debugPrint(response.result.error as Any)
                }
                
            }
            
    }
    func createUser(name: String, email: String, avatorName: String, AvatorColor: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
       
        let header = [ "Authorization": "Bearer \(AuthServices.instance.authToken)",
            "content-Type": "application/JSON; Charset = UTF-8"
        ]
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatorName,
            "avatarColor": AvatorColor
        ]
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                //usong swiftyJSON
                guard let data =  response.data else{ return }
                let json =  try! JSON(data: data)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatorName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name  = json["name"].stringValue
                
                UserDataServices.instance.setUserData(id: id, color: color, avatorName: avatorName, name: name, email: email)
                completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
                
            }
        }
        
    }
}


