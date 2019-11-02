//  Created by Wesley Espinoza on 9/10/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit
import Foundation

struct SettingsContent {
    let imageName: String!
    let title: String!
}

class SettingsTableViewController: UITableViewController {
    enum Sections: String {
        case account = "ACCOUNT"
        case other = "OTHER"
        static var all: [Sections] {
            return [.account, .other]
        }
    }
    
    let settingsContent: [SettingsContent] = [
    SettingsContent(imageName: "notification", title: "Notification"),
    SettingsContent(imageName: "email", title: "Update Email"),
    SettingsContent(imageName: "lock", title: "Change Password"),
    SettingsContent(imageName: "subscription", title: "Manage Subscription"),
    SettingsContent(imageName: "privacy", title: "Privacy Policy"),
    SettingsContent(imageName: "term", title: "Terms"),
    SettingsContent(imageName: "feedback", title: "Help & Feedback")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavbar()
        setupTableViewComponents()
    }

    private func setupTableViewComponents() {
        tableView.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1)
        tableView.alwaysBounceVertical = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.cellId)
        tableView.register(SettingsHeaderView.self, forHeaderFooterViewReuseIdentifier: SettingsHeaderView.headerId)
        tableView.rowHeight = 50
//        tableView.tableHeaderView =
        /// TODO: - fix back ground color
        tableView.tableFooterView = View.initView(backgroundColor: #colorLiteral(red: 0.0862745098, green: 0.08235294118, blue: 0.1254901961, alpha: 1))
    }
    
    private func setUpNavbar() {
        let button = Button()
        button.setTitle("Sign Out", for: .normal)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        
        let rightBarButtonItem = UIBarButtonItem(customView: button)
        rightBarButtonItem.tintColor = #colorLiteral(red: 0.4, green: 0.137254902, blue: 0.8196078431, alpha: 1)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func signOut() {
        print("signing out")
    }
    
}

extension SettingsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        
        switch section {
        case .Account: return AccountOptions.allCases.count
        case .Other: return OtherOptions.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingsHeaderView.headerId) as! SettingsHeaderView
        headerView.textLabel?.text = SettingsSection(rawValue: section)?.description
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.cellId, for: indexPath) as! SettingsTableViewCell
        guard let section = SettingsSection(rawValue: indexPath.section) else { return cell }
        
        switch section {
        case .Account:
            let accountIcon = AccountOptionsIcon(rawValue: indexPath.row)
            let account = AccountOptions(rawValue: indexPath.row)
            cell.iconImage.image = UIImage(named: accountIcon!.description)
            cell.sectionType = account
        case .Other:
            let other = OtherOptions(rawValue: indexPath.row)
            let otherIcon = OtherOptionsIcon(rawValue: indexPath.row)
            cell.iconImage.image = UIImage(named: otherIcon!.description)
            cell.sectionType = other
        }
        
        return cell
    }
}

