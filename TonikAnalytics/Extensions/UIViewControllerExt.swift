//
//  UIViewControllerExt.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

fileprivate var container: UIView!
fileprivate var blurEffectView: UIVisualEffectView?


extension UIViewController {
    
    func showSpinner() {
        container = UIView()
        container.layer.masksToBounds = false
        container.layer.cornerRadius = 25
        self.view.add(subview: container) { (v, p) in [
            v.heightAnchor.constraint(equalToConstant: 120),
            v.widthAnchor.constraint(equalToConstant: 140),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor)
            ]}
        
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.layer.masksToBounds = false
        blurEffectView?.clipsToBounds = true
        blurEffectView?.layer.cornerRadius = 20
        blurEffectView?.isOpaque = true
        blurEffectView?.frame = container.bounds
        container.addSubview(blurEffectView!)
        
        
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .white
        activityIndicatorView.startAnimating()
        container.add(subview: activityIndicatorView) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            v.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -10)
            ]}
        
        let label = Label.newLabel(title: "Loading...", textColor: .black, textSize: 18)
        label.textAlignment = .center
        container.add(subview: label) { (v, p) in [
            v.heightAnchor.constraint(equalToConstant: 20),
            v.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 10),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 10),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -10)
            ]}
        
    }
    
    func removeSpinner() {
        blurEffectView?.removeFromSuperview()
        container?.removeFromSuperview()
        blurEffectView = nil
        container = nil
    }
}
