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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width-60
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    @IBAction func prepareforumwind(segue: UIStoryboardSegue){}
   
  
}
