//
//  Created by Maximo Hinojosa on 9/13/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit


class View: UIView {
    
    public static func initView(backgroundColor: UIColor) -> View {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        
        return view
    }
}
