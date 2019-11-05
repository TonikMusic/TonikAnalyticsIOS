//
//  HelpAndSupportViewCell.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/7/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit



class SettingsTableViewCell: UITableViewCell {
    
    static let cellId = "SettingsTableViewCell"
    lazy var iconImage: CustomImage = self.createImage()
    lazy var titleLabel: Label = self.createTitle()
    lazy var rightImageView: CustomImage = self.createRightImage()
    lazy var switchControl: UISwitch = self.createSwitchControl()
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            titleLabel.text = sectionType.description
            rightImageView.isHidden = !sectionType.containsArrow
            switchControl.isHidden = !sectionType.containsSwitch
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1803921569, alpha: 1)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwitchAction(sender: UISwitch) {
        print("\(sender.isOn)")
    }
    
}

// MARK: - Explicit Method
extension SettingsTableViewCell {
    
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
    
    func createRightImage() -> CustomImage {
        let imageView = CustomImage.image(name: "rightArrow")
        return imageView
    }
    
    func createSwitchControl() -> UISwitch {
        let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.onTintColor = #colorLiteral(red: 0.7215686275, green: 0.2117647059, blue: 0.8862745098, alpha: 1)
        switchControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return switchControl
    }
}

// MARK: - Layout Methods
extension SettingsTableViewCell {
    func layout() {
        layoutImageView()
        layoutrightImageView()
        layoutSwitchControl()
        layoutTitleLabel()
    }
    
    
    func layoutImageView() {
        add(subview: iconImage) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 20),
            v.heightAnchor.constraint(equalToConstant: 30),
            v.widthAnchor.constraint(equalToConstant: 30)
            ]}
    }
    
    func layoutTitleLabel() {
        add(subview: titleLabel) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 20),
            v.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -20),
            v.heightAnchor.constraint(equalToConstant: 19)
            ]}
    }
    
    func layoutrightImageView() {
        add(subview: rightImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -20),
            v.widthAnchor.constraint(equalToConstant: 20),
            v.heightAnchor.constraint(equalToConstant: 20)
            ]}
    }
    
    func layoutSwitchControl() {
        add(subview: switchControl) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -20)
            ]}
    }
}
