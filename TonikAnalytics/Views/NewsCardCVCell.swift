//  Created by Wesley Espinoza on 9/25/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit

class NewsCardCVCell: UICollectionViewCell {
    static let reUseId = "NewsCardCell"
    
    var mainTitle: Label!
    var subTitle: Label!
    var mainBody: Label!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor  = .gray
        setupText()
    }
    
    func setupText(){
        mainTitle = Label.newLabel(title: "MainTitle", textColor: .white, textSize: 50)
        subTitle = Label.newLabel(title: "SubTitle", textColor: .white, textSize: 25)
        mainBody = Label.newLabel(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but Ipsum", textColor: .white, textSize: 20)
        mainBody.numberOfLines = 100
        
        self.add(subview: mainTitle) { (v, p) in [
                v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 8),
                v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                v.heightAnchor.constraint(equalToConstant: 50)
            ]}
        
        self.add(subview: subTitle) { (v, p) in [
                v.topAnchor.constraint(equalTo: mainTitle.safeAreaLayoutGuide.bottomAnchor, constant: 8),
                v.leadingAnchor.constraint(equalTo: mainTitle.safeAreaLayoutGuide.leadingAnchor, constant: 5),
                v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                v.heightAnchor.constraint(equalToConstant: 25)
            ]}
        
        self.add(subview: mainBody) { (v, p) in [
                v.topAnchor.constraint(equalTo: subTitle.safeAreaLayoutGuide.bottomAnchor, constant: 5),
                v.leadingAnchor.constraint(equalTo: subTitle.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            ]}
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
