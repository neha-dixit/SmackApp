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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let pass  = passwordTxt.text, passwordTxt.text != "" else { return }
        AuthServices.instance.registerUser(email: email, password: pass){
            (success) in
            if success {
                print ("Registered USer")
            }
        }
    }
    
    @IBAction func pickAvatorPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
}
