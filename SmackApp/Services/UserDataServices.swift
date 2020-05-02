//
//  UserDataServices.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/29/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import Foundation
class UserDataServices {
    static let instance = UserDataServices()
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var name = ""
    public private(set) var email = ""
    
    func setUserData(id: String, color: String, avatarName: String, name: String, email: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
        
    }
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    
}
