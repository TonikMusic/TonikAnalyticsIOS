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
        let home = MusicAnalyticsViewController()
        var homeIcon = UIImage(named: "home")
        homeIcon = homeIcon?.scaled(with: CGFloat(0.25))!.withRenderingMode(.alwaysOriginal)
        home.tabBarItem = UITabBarItem(title: "Home", image: homeIcon, tag: 0)
        let whiteLogo = UIImage(named: "logo-white")?.scaled(with: 0.05)
        let logoView = UIImageView(image: whiteLogo)
        home.navigationItem.titleView = logoView
        
        
        
        
        
        // NOTE: profile view controller
        let profile = SocialAnalyticsViewController()
        var profileIcon = UIImage(named: "profile")
        profileIcon = profileIcon?.scaled(with: CGFloat(0.25))!.withRenderingMode(.alwaysOriginal)
        profile.view.backgroundColor = .white
        profile.tabBarItem = UITabBarItem(title: "Profile", image: profileIcon, tag: 1)
        profile.title = "profile"
        
        
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
        let controllers = [home, profile, settings]
        // NOTE: maps all the controllers to a UINAvigationController
        viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        self.selectedIndex = 2
        
        setNeedsStatusBarAppearanceUpdate()
    }
}
    



