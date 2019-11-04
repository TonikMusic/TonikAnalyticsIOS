//
//  SettingsHeaderView.swift
//  TonikAnalytics
//
//  Created by Student Loaner 3 on 10/8/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit

class SettingsHeaderView: UIView {
    static let headerId: String = String(describing: self)
    lazy var header: Label = self.createHeader()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Explicit Method
extension SettingsHeaderView {
    func createHeader() -> Label {
        let header = Label.newLabel(title: "", textColor: .white, textSize: 20)
        header.font = UIFont.boldSystemFont(ofSize: 18)
        return header
    }
}

// MARK: - Layout Methods
extension SettingsHeaderView {
    func layout() {
        layoutHeader()
    }
    
    func layoutHeader() {
        self.add(subview: header) { (v, p) in [
        v.topAnchor.constraint(equalTo: p.topAnchor, constant: 15),
        v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 15),
        v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: 15),
        v.heightAnchor.constraint(equalToConstant: 20),
        ]}
    }
}
