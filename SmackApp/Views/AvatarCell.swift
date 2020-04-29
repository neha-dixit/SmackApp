//
//  AvatarCell.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/29/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    //outlets
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
