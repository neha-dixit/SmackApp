//
//  CircleImage.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 5/2/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import Foundation
@IBDesignable
class circleImage: UIImageView {

    override func awakeFromNib() {
        setUpView()
        
    }
    func setUpView() {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    

}
