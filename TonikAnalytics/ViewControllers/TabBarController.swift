//
//  Created by Wesley Espinoza on 9/11/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit
class TabBarController: UITabBarController {
    
    // MARK: - Properties
    var addArtistButton: UIButton!
    var coordinator: TabBarCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        updateNavigationUI()
        setNeedsStatusBarAppearanceUpdate()
        setUpButton()
    }
    
    func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1803921569, alpha: 1)
        
        // NOTE: homeview controller
        var homeIcon = UIImage(named: "homeIcon")
        homeIcon = homeIcon?.withRenderingMode(.alwaysOriginal)
        
        let nav1 = UINavigationController()
        let trackedArtistsCoordinator = TrackedArtistsCoordinator(navigationController: nav1)
        trackedArtistsCoordinator.start()
        trackedArtistsCoordinator.viewController.view.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        trackedArtistsCoordinator.viewController.tabBarItem = UITabBarItem(title: "Artists", image: homeIcon, tag: 0)
        trackedArtistsCoordinator.viewController.navigationItem.title = "Tracked artists"
        
        
        // NOTE: settings view controller
        var settingsIcon = UIImage(named: "settings")
        settingsIcon = settingsIcon?.withRenderingMode(.alwaysOriginal)
        
        let nav2 = UINavigationController()
        let settingsCoordinator = SettingsCoordinator(navigationController: nav2)
        settingsCoordinator.start()
        settingsCoordinator.viewController.view.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        settingsCoordinator.viewController.tabBarItem = UITabBarItem(title: "Settings", image:settingsIcon, tag: 2)
        settingsCoordinator.viewController.title = "Settings"
        
        // NOTE: set up of the TabBarController and adding the viewControllers
        let controllers: [UIViewController]? = [trackedArtistsCoordinator.navController, settingsCoordinator.navController]
        viewControllers = controllers
    }
    
    func setUpButton() {
        addArtistButton = UIButton(type: .roundedRect)
        tabBar.add(subview: addArtistButton) { (v, p) in [
            v.heightAnchor.constraint(equalToConstant: 75),
            v.widthAnchor.constraint(equalToConstant: 75),
            v.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
            v.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor)
            ]}
        
        addArtistButton.setBackgroundImage(UIImage(named: "addButton"), for: .normal)
        addArtistButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1803921569, alpha: 1)
        addArtistButton.layer.borderColor = UIColor.init(hexString: "#1D1E2E", alpha: 0.999).cgColor
        addArtistButton.layer.borderWidth = 10
        addArtistButton.layer.cornerRadius = addArtistButton.frame.width / 2
        

    }
    
    func updateNavigationUI() {
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1803921569, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.selectedViewController = viewControllers?[0]
    }
}
    



