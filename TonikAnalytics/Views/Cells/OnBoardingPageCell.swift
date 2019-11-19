//  Created by Student Loaner 3 on 9/30/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit


class OnBoardingPageCell: UICollectionViewCell {
    
    static let cellId = "cellId"
    let onBoardingImg = CustomImage.image(name: "")
    let onBoardingLabel = Label.newLabel(title: "", textColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1), textSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell() {
        let labelHeight = onBoardingLabel.optimalHeight
        onBoardingLabel.frame = CGRect(x: onBoardingLabel.frame.origin.x, y: onBoardingLabel.frame.origin.y, width: onBoardingLabel.frame.width, height: labelHeight)
        onBoardingLabel.textAlignment = .center
        onBoardingLabel.numberOfLines = 0
        
        self.add(subview: onBoardingImg) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 80),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor, constant: -150)
            ]}
        
        onBoardingImg.add(subview: onBoardingLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: onBoardingImg.bottomAnchor, constant: 20),
            v.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            v.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            ]}
    }
    
    
}
