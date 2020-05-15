//
//  ProfileVC.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 5/13/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var bgview: UIView!
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closedModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataServices.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
    }
    func setUpView(){
        userName.text = UserDataServices.instance.name
        userEmail.text = UserDataServices.instance.email
        userImg.image = UIImage(named: UserDataServices.instance.avatarName1)
        userImg.backgroundColor = UserDataServices.instance.returnUIColor(components: UserDataServices.instance.avatarColor)
        // gesture recognizer
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_recognizer:)))
        bgview.addGestureRecognizer(closeTouch)
        
    }
    @objc func closeTap(_recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
