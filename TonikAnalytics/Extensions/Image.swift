//  Created by Student Loaner 3 on 9/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit

class CustomImage: UIImageView {
    
    public static func image(name: String) -> UIImageView {
        let image = UIImage(named: name)
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
}
