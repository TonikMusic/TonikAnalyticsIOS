//
//  SettingsTableViewHeaderView.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 11/2/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit


class UserInfoHeaderView: UIView {
    
    // MARK: - Properties
    
    lazy var baseCircleView: View = self.createBaseCircleView()
    lazy var profileImageView: UIImageView = self.createProfileImageView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Explicit Methods

extension UserInfoHeaderView {
    func createBaseCircleView() -> View {
        let view = View.initView(backgroundColor: #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1803921569, alpha: 1))
        return view
    }
    
    func createProfileImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profileIcon")
        return imageView
    }
}

// MARK: - Layout Methods

extension UserInfoHeaderView {
    func layout() {
        layoutProfileImageView()
    }
    
    func layoutProfileImageView() {
        let profileImageDimension: CGFloat = 80
        add(subview: profileImageView) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.heightAnchor.constraint(equalToConstant: profileImageDimension),
            v.widthAnchor.constraint(equalToConstant: profileImageDimension)
            ]}
        profileImageView.layer.cornerRadius = profileImageDimension / 2
    }
}
