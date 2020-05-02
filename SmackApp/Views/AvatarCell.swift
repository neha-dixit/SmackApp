//
//  AvatarCell.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/29/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit
//enum for segment dark and night
enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    //outlets
   
    @IBOutlet weak var avatarImg: UIImageView!
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // to configure segments in dark and light
    func configureCell(index: Int, type: AvatarType){
        if type == AvatarType.dark {
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.green.cgColor
        }
        else {
            print("inside light")
            avatarImg.image = UIImage(named: "light\(index)")
                self.layer.backgroundColor = UIColor.gray.cgColor
            }
        }
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    }
    

