//  Created by Wesley Espinoza on 9/20/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit


enum TrackedPlatforms: CaseIterable{
    case YouTube
    case Instagram
    case Spotify
    case AppleMusic
    case TikTok
    case SoundCloud
    case Twitter
}

class TrackedArtistCell: UICollectionViewCell {
    static let reUseID = "TrackedArtistCell"
    let artistImageView: UIImageView = UIImageView(image: UIImage(named: "tempArtist"))
    var artistName: String! {
        didSet{
            self.artistLabel.text = self.artistName
        }
    }
    
    let platformText = Label.newLabel(title: "Tracked Platforms:", textColor: .white, textSize: 10)
    
    var activePlatforms: [TrackedPlatforms] = []
    let artistLabel = Label.newLabel(title: "Sample Artist", textColor: .white, textSize: 20)
    let firstPlatformView: PlatformView = PlatformView()
    let secondPlatformView: PlatformView = PlatformView()
    let thirdPlatformView: PlatformView = PlatformView()
    let fourthPlatformView: PlatformView = PlatformView()
    let fifthPlatformView: PlatformView = PlatformView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(hexString: "#1D1E2E")
        self.contentView.layer.cornerRadius = 15
        self.layer.cornerRadius = 15
        setUpImageView()
        setUpArtistLabel()
        setUpPlatforms()
        
    }
    
    func setUpArtistLabel() {
        self.add(subview: artistLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 5)
            ]}
        
        self.add(subview: platformText) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor, constant: -10),
            v.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 5)
             ]}
        
    }
    
    func setUpImageView(){
        self.add(subview: artistImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8)
            ]}
        artistImageView.clipsToBounds = true
        artistImageView.layer.cornerRadius = artistImageView.bounds.width / 2
    }
    
    func setUpPlatforms(){
        self.add(subview: firstPlatformView) { (v, p) in [
            v.topAnchor.constraint(equalTo: platformText.bottomAnchor, constant: 40),
            v.leadingAnchor.constraint(equalTo: artistImageView.trailingAnchor, constant: 40)
            ]}
        
        self.add(subview: secondPlatformView) { (v, p) in [
            v.topAnchor.constraint(equalTo: firstPlatformView.topAnchor, constant: 0),
            v.leadingAnchor.constraint(equalTo: firstPlatformView.trailingAnchor, constant: 40)
            ]}
        self.add(subview: thirdPlatformView) { (v, p) in [
            v.topAnchor.constraint(equalTo: firstPlatformView.topAnchor, constant: 0),
            v.leadingAnchor.constraint(equalTo: secondPlatformView.trailingAnchor, constant: 40)
            ]}
        self.add(subview: fourthPlatformView) { (v, p) in [
        v.topAnchor.constraint(equalTo: firstPlatformView.topAnchor, constant: 0),
        v.leadingAnchor.constraint(equalTo: thirdPlatformView.trailingAnchor, constant: 40)
        ]}
        self.add(subview: fifthPlatformView) { (v, p) in [
        v.topAnchor.constraint(equalTo: firstPlatformView.topAnchor, constant: 0),
        v.leadingAnchor.constraint(equalTo: fourthPlatformView.trailingAnchor, constant: 40)
        ]}
    }
    
    
    // NOTE: required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


