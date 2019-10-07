//  Created by Wesley Espinoza on 9/26/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit

class NewsHeaderView: UICollectionReusableView {
    static let reUseId = "NewsHeaderView"
    var header = Label.newLabel(title: "What's New", textColor: .black, textSize: 20)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        header.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.add(subview: header) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: 15),
            ]}
    }
}
