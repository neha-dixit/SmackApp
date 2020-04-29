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
    public private(set) var avatorColor = ""
    public private(set) var avatorName = ""
    public private(set) var name = ""
    public private(set) var email = ""
    
    func setUserData(id: String, color: String, avatorName: String, name: String, email: String){
        self.id = id
        self.avatorColor = color
        self.avatorName = avatorName
        self.email = email
        self.name = name
        
    }
    func setAvatorName(avatorName: String){
        self.avatorName = avatorName
    }
    
    
}
