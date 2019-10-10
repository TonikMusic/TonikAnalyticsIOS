//
//  HelpAndSupportViewCell.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/7/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit



class SettingsCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "SettingsCollectionViewCell"
    lazy var imageView: CustomImage = self.createImage()
    lazy var titleLabel: Label = self.createTitle()
    lazy var textLabel: Label = self.createTextLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.6941176471, blue: 0.8039215686, alpha: 1)
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


extension SettingsCollectionViewCell {
    
    func createImage() -> CustomImage {
        let image = CustomImage.image(name: "")
        return image
    }
    
    func createTitle() -> Label {
        let titleLabel = Label.newLabel(title: "", textColor: .white, textSize: 18)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 19)
        titleLabel.textAlignment = .left
        return titleLabel
    }
    
    func createTextLabel() -> Label {
        let textLabel = Label.newLabel(title: "", textColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), textSize: 16)
        let labelHeight = textLabel.optimalHeight
        textLabel.frame = CGRect(x: textLabel.frame.origin.x, y: textLabel.frame.origin.y, width: textLabel.frame.width, height: labelHeight)
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        return textLabel
    }
}


extension SettingsCollectionViewCell {
    func layout() {
        layoutImageView()
        layoutTitleLabel()
        layoutTextLabel()
    }
    
    
    func layoutImageView() {
        add(subview: imageView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 20),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 20),
            v.heightAnchor.constraint(equalToConstant: 30),
            v.widthAnchor.constraint(equalToConstant: 30)
            ]}
    }
    
    func layoutTitleLabel() {
       
        
        add(subview: titleLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 20),
            v.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -20),
            v.heightAnchor.constraint(equalToConstant: 19)
            ]}
    }
    
    func layoutTextLabel() {
        
        add(subview: textLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            v.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -20),
            
            ]}
    }
}
