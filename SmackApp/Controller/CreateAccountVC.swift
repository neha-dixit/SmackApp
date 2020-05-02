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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
   
    @IBOutlet weak var userImg: UIImageView!
    
    // some defualt variables we created here
   var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
       // viewDidAppear(true)

        // Do any additional setup after loading the view.
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDataServices.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataServices.instance.avatarName)
            avatarName = UserDataServices.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
   
    
    
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
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
                                print(UserDataServices.instance.name, UserDataServices.instance.avatarName, UserDataServices.instance.email)
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                            
                        })
                   }
                })
                NotificationCenter.default.post(NOTIF_USER_DATA_DID_CHANGE)
            }
            else{
                debugPrint("error user not created")
            }
        }
    }
    
    @IBAction func pickAvatorPressed(_ sender: Any) {
         
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
        viewDidAppear(true)
        
        
    }
    
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
       let r = CGFloat(arc4random_uniform(255))/255
       let g = CGFloat(arc4random_uniform(255))/255
       let b = CGFloat(arc4random_uniform(255))/255
       bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColor
        
        }
    }
    func setUpView(){
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: smackPurplecolor])
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplecolor])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: smackPurplecolor])
        spinner.isHidden = true
        
        
    }
}
