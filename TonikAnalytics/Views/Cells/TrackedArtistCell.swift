//  Created by Wesley Espinoza on 9/20/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit

class TrackedArtistCell: UICollectionViewCell {
    static let reUseID = "TrackedArtistCell"
    let artistImageView: UIImageView = UIImageView(image: UIImage(named: "tempArtist"))
    var artistName: String! {
        didSet{
            self.artistLabel.text = self.artistName
        }
    }
    let artistLabel: UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(hexString: "#1D1E2E")
        self.contentView.layer.cornerRadius = 15
        self.layer.cornerRadius = 15
        setUpImageView()
        setUpArtistLabel()
        
    }
    
    func setUpArtistLabel() {
        artistLabel.font = UIFont.systemFont(ofSize: 25)
        self.add(subview: artistLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 5)
            ]}
    }
    
    func setUpImageView(){
        self.add(subview: artistImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8)
            ]}
        artistImageView.clipsToBounds = true
        artistImageView.layer.cornerRadius = artistImageView.bounds.width / 2
        artistImageView.layer.borderWidth = 3
    }
    
    
    // NOTE: required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


