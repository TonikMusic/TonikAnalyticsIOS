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
    var mainCounter = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setupViews(){
        socialLabel.text = "Instagram"
        
        add(subview: socialLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 8),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: 25)
            ]}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
