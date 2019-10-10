//  Created by Wesley Espinoza on 9/10/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit
import Foundation

class MusicAnalyticsViewController: UIViewController {
    
    let graphView = BarGraphView()
    let AppleMButton = GraphButton()
    let SpotifyButton = GraphButton()
    let YouTubeButton = GraphButton()
    let SCButton = GraphButton()
    let overAllButton = GraphButton()
    
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 125
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        setupGraph()
        setupButtons()
        
        let months = ["nil", "nil", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
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
        
        AppleMButton.mainCounter = 5
        AppleMButton.socialLabel.text = "Apple Music"
        
        view.add(subview: AppleMButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        SpotifyButton.mainCounter = 5
        SpotifyButton.socialLabel.text = "Spotify"
        
        view.add(subview: SpotifyButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: AppleMButton.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        YouTubeButton.mainCounter = 5
        YouTubeButton.socialLabel.text = "YouTube"
        
        view.add(subview: YouTubeButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: AppleMButton.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        SCButton.mainCounter = 5
        SCButton.socialLabel.text = "SoundCloud"
        
        view.add(subview: SCButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: YouTubeButton.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.widthAnchor.constraint(equalToConstant: buttonWidth),
            v.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]}
        
        overAllButton.mainCounter = 5
        overAllButton.socialLabel.text = "Overall Growth"
        
        view.add(subview: overAllButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: YouTubeButton.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            v.trailingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.leadingAnchor.constraint(equalTo: graphView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.heightAnchor.constraint(equalToConstant: buttonHeight - 25)
            ]}
        
    }
    
}
