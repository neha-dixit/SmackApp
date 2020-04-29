//
//  AvatarPickerVC.swift
//  SmackApp
//
//  Created by Saurabh Dixit on 4/29/20.
//  Copyright © 2020 Dixit. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    
    //outlets
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self

        // Do any additional setup after loading the view.
    }
//collectionview stubs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 28
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
           return cell
       }
        return AvatarCell()
    }
    //func collectionView(_ collectionView: UICollectionView, numberofItemsInSection section: Int)-> Int {
    //    return
  //  }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //actions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segementControlChange(_ sender: Any) {
    }
    

}
