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

class LineGraphView: LineChartView{
    
    // TODO: Refactor code comment and make cleaner
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.noDataText = "Link account to display data."
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOverallChart() {
        
    }
    
    func setChart(_ dataPoints: [Double], _ values:[Double], _ platform: String = "",  _ graphAll: Bool = false, _ dataPointsArr: [[Double]] = [], _ valuesArr: [[Double]] = []){
        let circleR: CGFloat = 3
        let lineW: CGFloat = 2
        if graphAll {
            let lineChartData = LineChartData()
            for i in 0...dataPointsArr.count - 1 {
                var dataEntries: [ChartDataEntry] = []
                let dataPoint = dataPointsArr[i]
                for j in 0..<dataPoint.count - 1 {
                    let dataEntry = ChartDataEntry(x: Double(j), y: valuesArr[i][j])
                    dataEntries.append(dataEntry)
                }
                var lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Instagam")
                if i == 0 {
                    lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Instagam")
                    lineChartDataSet.colors = [.purple]
                    lineChartDataSet.circleColors = [.black]
                    lineChartDataSet.circleRadius = circleR
                    lineChartDataSet.lineWidth = lineW
                    lineChartData.addDataSet(lineChartDataSet)
                } else if i == 1{
                    lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "YouTube")
                    lineChartDataSet.colors = [.red]
                    lineChartDataSet.circleColors = [.black]
                    lineChartDataSet.circleRadius = circleR
                    lineChartDataSet.lineWidth = lineW
                    lineChartData.addDataSet(lineChartDataSet)
                } else if i == 2{
                    lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Twitter")
                    lineChartDataSet.colors = [.blue]
                    lineChartDataSet.circleColors = [.black]
                    lineChartDataSet.circleRadius = circleR
                    lineChartDataSet.lineWidth = lineW
                    lineChartData.addDataSet(lineChartDataSet)
                }
                else if i == 3{
                    lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "soundCloud")
                    lineChartDataSet.colors = [.orange]
                    lineChartDataSet.circleColors = [.black]
                    lineChartDataSet.circleRadius = circleR
                    lineChartDataSet.lineWidth = lineW
                    lineChartData.addDataSet(lineChartDataSet)
                }
                
            }
            
            
            self.data = lineChartData
            
        } else {
            var dataEntries: [ChartDataEntry] = []
            
            for i in 0..<dataPoints.count {
                let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
                dataEntries.append(dataEntry)
            }
            
            var lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Followers")
            switch platform {
            case "Instagram":
                lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Instagram")
                lineChartDataSet.colors = [.purple]
                lineChartDataSet.circleColors = [.black]
                lineChartDataSet.circleRadius = circleR
                lineChartDataSet.lineWidth = lineW
                break
            case "YouTube":
                lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "YouTube")
                lineChartDataSet.colors = [.red]
                lineChartDataSet.circleColors = [.black]
                lineChartDataSet.circleRadius = circleR
                lineChartDataSet.lineWidth = lineW
                break
            case "Twitter":
                lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Twitter")
                lineChartDataSet.colors = [.blue]
                lineChartDataSet.circleColors = [.black]
                lineChartDataSet.circleRadius = circleR
                lineChartDataSet.lineWidth = lineW
                break
            case "SoundCloud":
                lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "SoundCloud")
                lineChartDataSet.colors = [.orange]
                lineChartDataSet.circleColors = [.black]
                lineChartDataSet.circleRadius = circleR
                lineChartDataSet.lineWidth = lineW
                break
            default:
                break
            }

            let lineChartData = LineChartData(dataSet: lineChartDataSet)
            self.data = lineChartData
            
            let gradientColors = [UIColor.init(hexString: "#f6b1cd").cgColor, UIColor.clear.cgColor] as CFArray
            let colorLocation: [CGFloat] = [1.0, 0.0]
            
            guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocation) else {
                print("gradient Error")
                return
            }
            
            lineChartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
            lineChartDataSet.drawFilledEnabled = true
        }
        
    }
    
}
