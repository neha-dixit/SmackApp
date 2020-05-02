//
//  Constants.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/18/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import Foundation
//segues
let TO_LOGIN = "toLogin"

let  TO_CREATE_ACCOUNT = "ToCreateAccount"
let  UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
// typealias
typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
//let BASE_URL = "https://nehachat.herokuapp.com/v1"
let BASE_URL = "http://localhost:3005/v1/"
//"https://nehachat.herokuapp.com"
let URL_REGISTER = "\(BASE_URL)account/register"
// http://localhost:3005/v1/account/register
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Headers
let HEADER = ["content-Type": "application/JSON; Charset = UTF-8"]
// colors
let smackPurplecolor = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)
//notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification(name: Notification.Name(rawValue: "notifiy new user is created"))
