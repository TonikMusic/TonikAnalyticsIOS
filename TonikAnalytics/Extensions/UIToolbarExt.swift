//
//  Created by Student Loaner 3 on 10/3/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit

extension UIToolbar {
    
    func ToolbarPicker(mySelect: Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()

        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: mySelect)
        
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
}
