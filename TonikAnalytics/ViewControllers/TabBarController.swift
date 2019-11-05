//
//  Created by Wesley Espinoza on 9/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit
class TabBarController: UITabBarController {
    var addArtistButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.barTintColor = #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1803921569, alpha: 1)
        
        
        // NOTE: homeview controller
        let musicStats = TrackedArtistsViewController()
        var homeIcon = UIImage(named: "homeIcon")
        musicStats.view.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        homeIcon = homeIcon?.withRenderingMode(.alwaysOriginal)
        musicStats.tabBarItem = UITabBarItem(title: "Artists", image: homeIcon, tag: 0)
        musicStats.navigationItem.title = "Tracked artists"
        
        
        // NOTE: settings view controller
        let settings = SettingsTableViewController()
        var settingsIcon = UIImage(named: "settings")
        // NOTE: sets the icon to a scaled image with the original colors
        settingsIcon = settingsIcon?.withRenderingMode(.alwaysOriginal)
        settings.view.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        settings.tabBarItem = UITabBarItem(title: "Settings", image:settingsIcon, tag: 2)
        settings.title = "Settings"
        // NOTE: set up of the TabBarController and adding the viewControllers
        let controllers = [musicStats, settings]
        // NOTE: maps all the controllers to a UINAvigationController
        viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    
        setNeedsStatusBarAppearanceUpdate()
        
        setUpButton()
    }
    
    func setUpButton(){
        addArtistButton = UIButton(type: .roundedRect)
        tabBar.add(subview: addArtistButton) { (v, p) in [
            v.heightAnchor.constraint(equalToConstant: 75),
            v.widthAnchor.constraint(equalToConstant: 75),
            v.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
            v.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor)
            ]}
        
        addArtistButton.setBackgroundImage(UIImage(named: "addButton"), for: .normal)
        addArtistButton.layer.borderColor = UIColor.init(hexString: "#1D1E2E", alpha: 0.999).cgColor
        addArtistButton.layer.borderWidth = 10
        addArtistButton.layer.cornerRadius = addArtistButton.frame.width / 2
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.selectedViewController = viewControllers?[0]
    }
}
    



