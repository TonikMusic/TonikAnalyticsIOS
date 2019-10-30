//
//  UIViewControllerExt.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

fileprivate var aView: UIView?
fileprivate var blurEffectView: UIVisualEffectView?

extension UIViewController {
    
    func showSpinner() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView!)
        aView = UIView(frame: self.view.frame)
        
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.center = aView!.center
        activityIndicator.startAnimating()
        aView?.addSubview(activityIndicator)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        blurEffectView?.removeFromSuperview()
        aView?.removeFromSuperview()
        blurEffectView = nil
        aView = nil
    }
}
