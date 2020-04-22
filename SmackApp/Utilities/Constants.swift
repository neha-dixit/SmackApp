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
//let T0_CREATE_ACCOUNT = "ToCreateAccount"
let  TO_CREATE_ACCOUNT = "ToCreateAccount"
let  UNWIND = "unwindToChannel"

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
// typealias
typealias CompletionHandler = (_ Success: Bool) -> ()
// URL Constants
let BASE_URL = "https://nehachat.herokuapp.com/v1"
//"https://nehachat.herokuapp.com"
let URL_REGISTER = "\(BASE_URL)account/register"
// http://localhost:3005/v1/account/register
