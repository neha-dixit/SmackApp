//
//  CreateAccountVC.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/19/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
