//
//  ChannelVC.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/17/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //outlets
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var userImg: circleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width-60
        //notification observer
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    @objc func userDataDidChange(_ notif: Notification){
          
           if AuthServices.instance.isLoggedIn {
                print("hey i am inside this userdatatdidchange function")
               loginBtn.setTitle(UserDataServices.instance.name, for: .normal)
               userImg.image = UIImage(named: UserDataServices.instance.avatarName1)
               userImg.backgroundColor = UserDataServices.instance.returnUIColor(components: UserDataServices.instance.avatarColor)
           } else {
               loginBtn.setTitle("Login", for: .normal)
               userImg.image = UIImage(named: "menuProfileIcon")
               userImg.backgroundColor = UIColor.clear
           }
       }
       
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        if AuthServices.instance.isLoggedIn {
            //show profile here
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    @IBAction func prepareforumwind(segue: UIStoryboardSegue){}
    
   
}
