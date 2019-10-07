//  Created by Wesley Espinoza on 9/20/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit

class FeaturedCVCell: UICollectionViewCell {
    static let reUseID = "FeaturedCell"
    
    var artistsCollectionView: UICollectionView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setUpArtistsCollectionView()
    }
    
    func setUpArtistsCollectionView(){
        // NOTE: sets the flow layout and makes the scroll horizontal
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        // NOTE: init the collection view
        artistsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height), collectionViewLayout: flowLayout)
        artistsCollectionView.dataSource = self
        artistsCollectionView.delegate = self
        artistsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        artistsCollectionView.backgroundColor = .white
        artistsCollectionView.register(ArtistCVCell.self, forCellWithReuseIdentifier: ArtistCVCell.reUseId)
        // NOTE: add to parent view with constraints
        self.add(subview: artistsCollectionView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 50),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: p.bounds.height - 200)
            
            ]}
    }
    
    // NOTE: required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// NOTE: Extensions for colelctionView
extension FeaturedCVCell: UICollectionViewDataSource {
    
    // NOTE: numbers of cells to return
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // NOTE: what kind of cell to return
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = artistsCollectionView.dequeueReusableCell(withReuseIdentifier: ArtistCVCell.reUseId, for: indexPath) as! ArtistCVCell
        
        cell.layer.cornerRadius = 15
        return cell
    }
    
    // NOTE: was the cell tappped
    
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
        
    }
}

// NOTE: collectionView delegate extension
extension FeaturedCVCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
// NOTE: CollectionViewDelegateFlowLayout extension
extension FeaturedCVCell: UICollectionViewDelegateFlowLayout {
    
    
    // NOTE: size of the cell
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: artistsCollectionView.bounds.width - 100, height: artistsCollectionView.bounds.height - 125 )
    }
    
    // NOTE: padding
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 75, left: 25, bottom: 25, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    

}
