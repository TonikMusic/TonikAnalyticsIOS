//
//  platformView.swift
//  TonikAnalytics
//
//  Created by Wesley Espinoza on 11/4/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class PlatformView: UIView{
    
    let platformImageView: UIImageView = UIImageView(image: UIImage(named: "spotifyIcon"))
    let platformNameLabel: Label = Label.newLabel(title: "Spotify", textColor: .white, textSize: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        self.add(subview: platformImageView) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.topAnchor.constraint(equalTo: platformImageView.bottomAnchor, constant: 8),
            v.heightAnchor.constraint(equalToConstant: 25),
            v.widthAnchor.constraint(equalToConstant: 25)
            ]}
        self.add(subview: platformNameLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.topAnchor.constraint(equalTo: platformImageView.bottomAnchor, constant: 4)
            ]}
    }
    
    
    func setupViews(){
        platformImageView.backgroundColor = .clear
        platformImageView.translatesAutoresizingMaskIntoConstraints = false
        platformNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func changeImage(_ image: UIImage){
        self.platformImageView.image = image
    }
    
    public func changeTitle(_ text: String){
        self.platformNameLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
