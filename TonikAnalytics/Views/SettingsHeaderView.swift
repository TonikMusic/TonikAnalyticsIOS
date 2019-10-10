//
//  SettingsHeaderView.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/8/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class SettingsHeaderView: UICollectionReusableView {
    static let cellId = "SettingsHeaderID"
    var header = Label.newLabel(title: "", textColor: .black, textSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        header.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.add(subview: header) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 15),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: 20),
            ]}
    }
}
