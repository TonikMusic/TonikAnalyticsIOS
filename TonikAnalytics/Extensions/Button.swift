//  Created by Wesley Espinoza on 9/9/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit


// NOTE: this is a custom button class
class Button: UIButton {
    
    // NOTE: function allows to make a custom buttom
    public static func customButton(title: String, titleSize: CGFloat = CGFloat(16), boldText: CGFloat = CGFloat(0), titleColor: UIColor, cornerRadius: CGFloat, backgroundColor: UIColor) -> Button {
        let button = Button(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //guard let boldText = boldText else { return button}
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: boldText)
        button.titleLabel?.font = UIFont.systemFont(ofSize: titleSize)
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        
        
        return button
    }
}

//self.add(subview: forgotPasswordLabel) { (v, p) in [
//    v.topAnchor.constraint(equalTo: lineView4.bottomAnchor, constant: 10),
//    v.centerXAnchor.constraint(equalTo: p.centerXAnchor, constant: 78),
//    v.widthAnchor.constraint(equalToConstant: 150),
//    v.heightAnchor.constraint(equalToConstant: 19)
//    ]}
// let forgotPasswordLabel = Label.customLabel(title: "Forgot your password?", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), textSize: 13)
