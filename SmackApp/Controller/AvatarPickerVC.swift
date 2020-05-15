//
//  AvatarPickerVC.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/29/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit
class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewAvatar: UICollectionView!
    //outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    // variable
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewAvatar.delegate = self
        collectionViewAvatar.dataSource = self
        
    }
    
    //collectionview stubs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numOfColumns : CGFloat = 3
        // its for small iphone and 320 is dimenstion for smallest iphone which is iphone SE currently
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
        }
        // calculate the width and size of our cell
        let spaceBetweenCells : CGFloat = 10
        let padding : CGFloat = 20
        let cellDimension = ((collectionViewAvatar.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / (numOfColumns)
        print(cellDimension)
        print(numOfColumns)
        return CGSize(width: cellDimension, height: cellDimension)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataServices.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
            print(UserDataServices.instance.avatarName1)
        } else {
            UserDataServices.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
        super.viewDidAppear(true)
    }
    
    //actions
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func SegementControlChange(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        collectionViewAvatar.reloadData()
    }
    
    
}
