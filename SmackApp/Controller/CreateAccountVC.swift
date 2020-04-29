//
//  CreateAccountVC.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/19/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var profileDefault: UIImageView!
    
    // some defualt variables we created here
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let pass  = passwordTxt.text, passwordTxt.text != "" else { return }
        AuthServices.instance.registerUser(email: email, password: pass){
            (success) in
            if success {
                print ("Registered USer")
                AuthServices.instance.loginUser(email: email, password: pass, completion: {
                   (success) in
                    if success {
                      //print("logged in User!", AuthServices.instance.authToken)
                        // here we put our login user detail and perform segue
                        AuthServices.instance.createUser(name: name, email: email, avatorName: self.avatarName, AvatorColor: self.avatarColor, completion:{
                            (success) in
                            if success {
                                print(UserDataServices.instance.name, UserDataServices.instance.avatorName, UserDataServices.instance.email)
                                
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                            
                        })
                   }
                })
            }
            else{
                debugPrint("error user not created")
            }
        }
    }
    
    @IBAction func pickAvatorPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
}
