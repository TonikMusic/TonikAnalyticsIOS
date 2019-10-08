//
//  GraphView.swift
//  TonikAnalytics
//
//  Created by Wesley Espinoza on 10/8/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import Foundation
import UIKit
import Charts

class GraphView: UIView{
    
    let graph = LineChartView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        graph.noDataText = "Link account to display data."
        
        self.add(subview: graph) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ]}
        bringSubviewToFront(graph)
        
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
