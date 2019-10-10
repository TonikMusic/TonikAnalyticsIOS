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
    var mainCounter: Int = 0 {
        didSet {
            if mainCounter > 0  {
                negGrowth.isHidden = true
            } else if mainCounter == 0 {
                posGrowth.isHidden = true
                negGrowth.isHidden = true
            } else {
                posGrowth.isHidden = true
                
            }
            mainCounterLabel.text = "\(mainCounter)"
        }
    }
    var mainCounterLabel = UILabel()
    var negGrowth = UIImageView(image: UIImage(named: "downSymbol"))
    var posGrowth = UIImageView(image: UIImage(named: "upSymbol"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        self.backgroundColor = UIColor.init(hexString: "#f6b1cd")
        self.dropShadow()
        self.layer.cornerRadius = 15
    }
    
    func setupViews(){
        
        socialLabel.textAlignment = .center
        mainCounterLabel.textAlignment = .center
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
        
        add(subview: negGrowth) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -5),
            v.widthAnchor.constraint(equalToConstant: 50),
            v.heightAnchor.constraint(equalToConstant: 25)
            ]}
        
        add(subview: posGrowth) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            v.topAnchor.constraint(equalTo: socialLabel.bottomAnchor, constant: 5),
            v.widthAnchor.constraint(equalToConstant: 50),
            v.heightAnchor.constraint(equalToConstant: 25)
            ]}
        
        add(subview: mainCounterLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            v.centerYAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerYAnchor, constant: 16),
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
