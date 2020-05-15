//
//  UserDataServices.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/29/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import Foundation
import UIKit
class UserDataServices {
    static let instance = UserDataServices()
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName1 = ""
    public private(set) var name = ""
    public private(set) var email = ""
    
    func setUserData(id: String, color: String, avatarName: String, name: String, email: String){
        self.id = id
        self.avatarColor = color
        self.avatarName1 = avatarName
        self.email = email
        self.name = name
        
    }
    func setAvatarName(avatarName: String){
        self.avatarName1 = avatarName
    }
    func returnUIColor(components: String) -> UIColor {
           let scanner = Scanner(string: components)
           let skipped = CharacterSet(charactersIn: "[], ")
           let comma = CharacterSet(charactersIn: ",")
           scanner.charactersToBeSkipped = skipped
           
           var r, g, b, a : NSString?
           
            scanner.scanUpToCharacters(from: comma, into: &r)
           scanner.scanUpToCharacters(from: comma, into: &g)
           scanner.scanUpToCharacters(from: comma, into: &b)
           scanner.scanUpToCharacters(from: comma, into: &a)
           
           let defaultColor = UIColor.lightGray
           
           guard let rUnwrapped = r else { return defaultColor }
           guard let gUnwrapped = g else { return defaultColor }
           guard let bUnwrapped = b else { return defaultColor }
           guard let aUnwrapped = a else { return defaultColor }
           
           let rfloat = CGFloat(rUnwrapped.doubleValue)
           let gfloat = CGFloat(gUnwrapped.doubleValue)
           let bfloat = CGFloat(bUnwrapped.doubleValue)
           let afloat = CGFloat(aUnwrapped.doubleValue)
        
           
           let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
           
           return newUIColor
       }
    func logoutUser(){
        id = ""
        avatarColor = ""
        avatarName1 = ""
        email = ""
        name = ""
        AuthServices.instance.authToken = ""
        AuthServices.instance.userEmail = ""
        AuthServices.instance.isLoggedIn = false
    }
    
}
