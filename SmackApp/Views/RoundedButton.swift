//
//  RoundedButton.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/24/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedButton: UIButton {
    @IBInspectable var cornerRadious: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadious
        
        }
    }
         override func awakeFromNib() {
        self.layer.cornerRadius = cornerRadious
        }
        
        override func prepareForInterfaceBuilder(){
                super.prepareForInterfaceBuilder()
            self.setupView()
            }
        
    
            func setupView(){
                self.layer.cornerRadius = cornerRadious
            }
    
    
}

