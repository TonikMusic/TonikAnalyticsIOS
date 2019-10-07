//  Created by Maximo Hinojosa 3 on 9/14/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit



class LogoView: UIView {
    
    // NOTE: instantiating UIView components
    let imageView = CustomImage.image(name: "logo")
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpView()
        updateUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // NOTE: this function constraints the view components
    func setUpView() {

        // NOTE: constrainting view components
        self.add(subview: imageView) { (v, p) in [
            v.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 100),
            v.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -20),
            v.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
//            v.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -40)
            v.heightAnchor.constraint(equalToConstant: 250)
            ]}
    }
    
    private func updateUIComponents() {
        imageView.dropCustomShadow(shadowColor: .black, shadowOpacity: 0.3, shadowOffsetWidth: 0.0, shadowOffsetHeight: 9.0)
    }
}
