//
//  GraphButton.swift
//  TonikAnalytics
//
//  Created by Wesley Espinoza on 10/8/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class GraphButton: UIButton{
    var socialLabel = UILabel()
    var mainCounter = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        self.backgroundColor = .darkGray
        self.dropShadow()
        self.layer.cornerRadius = 15
    }
    
    func setupViews(){
        socialLabel.textAlignment = .center
        mainCounter.textAlignment = .center
        socialLabel.adjustsFontSizeToFitWidth = true
        socialLabel.lineBreakMode = .byClipping
        
        self.translatesAutoresizingMaskIntoConstraints = false
        add(subview: socialLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 8),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.heightAnchor.constraint(equalToConstant: 25)
            ]}
        
           add(subview: mainCounter) { (v, p) in [
                 v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
                 v.centerYAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerYAnchor, constant: 8),
                 v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                 v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                 v.heightAnchor.constraint(equalToConstant: 25)
                 ]}
        
        layoutIfNeeded()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
