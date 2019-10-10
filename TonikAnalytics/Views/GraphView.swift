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

class GraphView: LineChartView{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.noDataText = "Link account to display data."
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.backgroundColor = .white
        self.dropShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChart(_ dataPoints: [String], _ values:[Double]){
        var dataEntries: [ChartDataEntry] = []
           
           for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(i))
               dataEntries.append(dataEntry)
           }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Followers")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        self.data = lineChartData
        
    }
    
}
