//  Created by Wesley Espinoza on 8/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit
import Foundation

class SocialAnalyticsViewController: UIViewController {
    let graphView = LineGraphView()
    let IGButton = GraphButton()
    let YTButton = GraphButton()
    let TWTRButton = GraphButton()
    let SCButton = GraphButton()
    let overAllButton = GraphButton()
    var IGData: [[Double]] = []
    var YTData: [[Double]] = []
    var TWTRData: [[Double]] = []
    var SCData: [[Double]] = []
    
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 125
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        IGData = generateRandomData()
        YTData = generateRandomData()
        TWTRData = generateRandomData()
        SCData = generateRandomData()
        
        setupGraph()
        setupButtons()
        graphView.setChart([0.0], [0.0], "", true,[IGData[0], YTData[0], TWTRData[0], SCData[0]], [IGData[1], YTData[1], TWTRData[1], SCData[1]])
        
        
    }
    
    func generateRandomData() -> [[Double]]{
        var timeSpan: [Double] = []
        var subs: [Double] = []
        
        for i in 0...Int.random(in: 15...30){
            
            timeSpan.append(Double(i))
            subs.append(Double.random(in: 0...100))
            
        }
        
        let arr = [timeSpan, subs]
        
        return arr
    }
    
    
    
    func setupGraph() {
        view.add(subview: graphView) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 8),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.heightAnchor.constraint(equalToConstant: 300)
            ]}
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @objc func socialButtonPressed(_ button: GraphButton) {
        switch button.tag {
        case 0:
            graphView.setChart(IGData[0], IGData[1], "Instagram")
            break
        case 1:
            graphView.setChart(YTData[0], YTData[1], "YouTube")
            break
        case 2:
            graphView.setChart(TWTRData[0], TWTRData[1], "Twitter")
            break
        case 3:
            graphView.setChart(SCData[0], SCData[1], "SoundCloud")
            break
        case 4:
            graphView.setChart([0.0], [0.0], "", true, [IGData[0], YTData[0], TWTRData[0], SCData[0]], [IGData[1], YTData[1], TWTRData[1], SCData[1]])
            break
        default:
            break
        }
        
    }
    
    
    func getDif(data: [[Double]]) -> Int {
        
        return Int(data[1][data[1].count - 1] - data[1][data[1].count - 2])
        
    }
    
    func getOverallDif() -> Int {
        
           
           return getDif(data: IGData) + getDif(data: YTData) + getDif(data: TWTRData) + getDif(data: SCData)
           
       }
    
    
    func setupButtons(){
        //TODO : Make Connectons to API to get real Data\
        
        IGButton.mainCounter = getDif(data: IGData)
        IGButton.socialLabel.text = "Instagram"
        IGButton.tag = 0
        IGButton.addTarget(self, action: #selector(socialButtonPressed), for: .touchUpInside)
        
        view.add(subview: IGButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        YTButton.mainCounter = getDif(data: YTData)
        YTButton.socialLabel.text = "YouTube"
        YTButton.tag = 1
        YTButton.addTarget(self, action: #selector(socialButtonPressed), for: .touchUpInside)
        
        view.add(subview: YTButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: IGButton.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        TWTRButton.mainCounter = getDif(data: TWTRData)
        TWTRButton.socialLabel.text = "Twitter"
        TWTRButton.tag = 2
        TWTRButton.addTarget(self, action: #selector(socialButtonPressed), for: .touchUpInside)
        
        view.add(subview: TWTRButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: IGButton.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        SCButton.mainCounter = getDif(data: SCData)
        SCButton.socialLabel.text = "SoundCloud"
        SCButton.tag = 3
        SCButton.addTarget(self, action: #selector(socialButtonPressed), for: .touchUpInside)
        
        view.add(subview: SCButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: TWTRButton.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        overAllButton.mainCounter = getOverallDif()
        overAllButton.socialLabel.text = "Overall growth"
        overAllButton.tag = 4
        overAllButton.addTarget(self, action: #selector(socialButtonPressed), for: .touchUpInside)
        
        view.add(subview: overAllButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: TWTRButton.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.heightAnchor.constraint(equalToConstant: buttonHeight - 25)
            ]}
        
    }
    
}
