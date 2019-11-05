//
//  TrackedArtistsViewController.swift
//  TonikAnalytics
//
//  Created by Wesley Espinoza on 11/3/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class TrackedArtistsViewController: UIViewController{
    var collectionView: UICollectionView!
    let collectionFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
    }
    
    
    func setUpCollectionView(){
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionFlowLayout)
        collectionView.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        collectionView.register(TrackedArtistCell.self, forCellWithReuseIdentifier: TrackedArtistCell.reUseID)
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}




extension TrackedArtistsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    
}

extension TrackedArtistsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackedArtistCell.reUseID, for: indexPath) as! TrackedArtistCell
        cell.artistName = "Sample Artist"
        return cell
    }
    
}

