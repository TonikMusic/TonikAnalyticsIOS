//
//  Created by Wesley Espinoza on 9/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NOTE: homeview controller
        let musicStats = MusicAnalyticsViewController()
        var homeIcon = UIImage(named: "home")
        musicStats.view.backgroundColor = .white
        homeIcon = homeIcon?.scaled(with: CGFloat(0.25))!.withRenderingMode(.alwaysOriginal)
        musicStats.tabBarItem = UITabBarItem(title: "Music", image: homeIcon, tag: 0)
        musicStats.navigationItem.title = "Music Analytics"
        
        
        
        
        
        // NOTE: profile view controller
        let socialSats = SocialAnalyticsViewController()
        var profileIcon = UIImage(named: "profile")
        profileIcon = profileIcon?.scaled(with: CGFloat(0.25))!.withRenderingMode(.alwaysOriginal)
        socialSats.view.backgroundColor = .white
        socialSats.tabBarItem = UITabBarItem(title: "Social", image: profileIcon, tag: 1)
        socialSats.navigationItem.title = "Social Analytics"
        
        
        // NOTE: settings view controller
        let layout = UICollectionViewFlowLayout()
        let settings = SettingsViewController(collectionViewLayout: layout)
        var settingsIcon = UIImage(named: "settings")
        // NOTE: sets the icon to a scaled image with the original colors
        settingsIcon = settingsIcon?.scaled(with: CGFloat(0.25))!.withRenderingMode(.alwaysOriginal)
        settings.view.backgroundColor = .white
        settings.tabBarItem = UITabBarItem(title: "Settings", image:settingsIcon, tag: 2)
        settings.title = "Settings"
        // NOTE: set up of the TabBarController and adding the viewControllers
        let controllers = [musicStats, socialSats, settings]
        // NOTE: maps all the controllers to a UINAvigationController
        viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.selectedViewController = viewControllers?[1]
    }
}
    



