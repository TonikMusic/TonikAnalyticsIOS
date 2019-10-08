//  Created by Wesley Espinoza on 8/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit
import Foundation

class SocialAnalyticsViewController: UIViewController {
    
    var mainScrollView: UIScrollView!
    let graphView = GraphView()
    let linkedSocialAccounts: [GraphButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        
        setupMainScrollView()
        setupButtons()
        graphView.backgroundColor = .white
        
        mainScrollView.add(subview: graphView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 8),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            v.heightAnchor.constraint(equalToConstant: 300)
            ]}
        
        mainScrollView.bringSubviewToFront(graphView)
        
    }
    
    
    func setupButtons(){
        
    }
    
    
    
    
    
    // Sets up the needed properties for the collectionView
    func setupMainScrollView(){
        // NOTE: baisc setup for collectionCiew
        mainScrollView = UIScrollView()
        mainScrollView.delegate = self
        mainScrollView.backgroundColor = .darkGray
        mainScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // NOTE: add to parent with constraints
        view.add(subview: mainScrollView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: p.bounds.height)
            ]}
        
        mainScrollView.contentSize = CGSize(width: mainScrollView.bounds.width, height: mainScrollView.bounds.height + 100)
        
    }
}


extension SocialAnalyticsViewController: UIScrollViewDelegate{
    
}
