//
//  Created by Wesley Espinoza on 9/9/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit


extension UIView {
    
    // NOTE: This function gives any view a shadow affect
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.30
        layer.shadowOffset = CGSize(width: 0.0, height: 9.0)
        layer.shadowRadius = 3
    }
    
    // NOTE: This funciton gives a custom shadow effect to target UIView
    func dropCustomShadow(shadowColor: UIColor, shadowOpacity: Float, shadowOffsetWidth: Double = 0.0, shadowOffsetHeight: Double) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowRadius = 3
    }

    // NOTE: This function gives a custom cell shadow affect
    func dropCellShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = 8
    }
    
    
    // NOTE: This helper method creates and contraints to views
    func add(subview: UIView, createConstraints: (_ view: UIView, _ parent: UIView) -> [NSLayoutConstraint]) {
        addSubview(subview)
        
        subview.activate(constraints: createConstraints(subview, self))
        subview.layoutIfNeeded()
    }
    
    func add(subview: UIView, sendViewToBack: Bool, createConstraints: (_ view: UIView, _ parent: UIView) -> [NSLayoutConstraint]) {
        addSubview(subview)
        
        if sendViewToBack == true {
            sendSubviewToBack(subview)
        }
        
        subview.activate(constraints: createConstraints(subview, self))
    }
    
    // NOTE: This funciton activates the given constraints
    func activate(constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    enum Point {
        case topLeft
        case centerLeft
        case bottomLeft
        case topCenter
        case center
        case bottomCenter
        case topRight
        case centerRight
        case bottomRight
        
        var point: CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: 0, y: 0)
            case .centerLeft:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeft:
                return CGPoint(x: 0, y: 1.0)
            case .topCenter:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottomCenter:
                return CGPoint(x: 0.5, y: 1.0)
            case .topRight:
                return CGPoint(x: 1.0, y: 0.0)
            case .centerRight:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomRight:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    func addLayer(start: Point, end: Point, colors: [CGColor], type: CAGradientLayerType) {
        let layer = CAGradientLayer()
        layer.startPoint = start.point
        layer.endPoint = end.point
        layer.colors = colors
        layer.type = type
        layer.cornerRadius = self.layer.cornerRadius
        layer.frame = self.layer.bounds
        self.layer.insertSublayer(layer, at: 0)
    }
    
    
}

