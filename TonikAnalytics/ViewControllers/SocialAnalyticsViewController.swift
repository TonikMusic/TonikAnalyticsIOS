//  Created by Wesley Espinoza on 8/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit
import Foundation

class SocialAnalyticsViewController: UIViewController {
    let graphView = GraphView()
    let IGButton = GraphButton()
    let FBButton = GraphButton()
    let TWTRButton = GraphButton()
    let SCButton = GraphButton()
    let overAllButton = GraphButton()
    
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 125
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        setupGraph()
        setupButtons()
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        graphView.setChart(months, unitsSold)
        
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
    
    
    func setupButtons(){
        //TODO : Make Connectons to API to get real Data\
        
        IGButton.mainCounter.text = "\(5)"
        IGButton.socialLabel.text = "Instagram"
        
        view.add(subview: IGButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        FBButton.mainCounter.text = "\(5)"
        FBButton.socialLabel.text = "Facebook"
        
        view.add(subview: FBButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: IGButton.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        TWTRButton.mainCounter.text = "\(5)"
        TWTRButton.socialLabel.text = "Twitter"
        
        view.add(subview: TWTRButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: IGButton.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        SCButton.mainCounter.text = "\(0)"
        SCButton.socialLabel.text = "Connect SoundCloud"
        
        view.add(subview: SCButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: TWTRButton.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        overAllButton.mainCounter.text = "\(65)"
        overAllButton.socialLabel.text = "Overall growth"
        
        view.add(subview: overAllButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: TWTRButton.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.heightAnchor.constraint(equalToConstant: buttonHeight - 25)
            ]}
        
    }
    
}
