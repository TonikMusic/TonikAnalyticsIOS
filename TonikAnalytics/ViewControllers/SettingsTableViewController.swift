//  Created by Wesley Espinoza on 9/10/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit
import Foundation


class SettingsTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    var userInfoHeaderView: UserInfoHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavbar()
        setupTableViewComponents()
    }

    
    private func setupTableViewComponents() {
        
        tableView.alwaysBounceVertical = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.cellId)
        tableView.rowHeight = 50
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 150)
        userInfoHeaderView = UserInfoHeaderView(frame: frame)
        tableView.tableHeaderView = userInfoHeaderView
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        
        switch section {
        case .Account: return AccountOptions.allCases.count
        case .Other: return OtherOptions.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SettingsHeaderView()
        headerView.header.text = SettingsSection(rawValue: section)?.description
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 2]:
            let updateEmailVC = UpdateEmailViewController()
            self.navigationController?.pushViewController(updateEmailVC, animated: true)
        case [0, 3]:
            let changePasswordVC = ChangePasswordViewController()
            self.navigationController?.pushViewController(changePasswordVC, animated: true)
        case [0, 4]:
            let manageSubcriptionsVC = ManageSubcriptionViewController()
            self.navigationController?.pushViewController(manageSubcriptionsVC, animated: true)
        case [1, 0]:
            let privacyPolicyVC = PrivacyPolicyViewController()
            self.navigationController?.pushViewController(privacyPolicyVC, animated: true)
        case [1, 1]:
            let termsVC = TermsViewController()
            self.navigationController?.pushViewController(termsVC, animated: true)
        case [1, 2]:
            let helpAndSupportVC = HelpAndSupportViewController()
            self.navigationController?.pushViewController(helpAndSupportVC, animated: true)
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.cellId, for: indexPath) as! SettingsTableViewCell
        cell.selectionStyle = .none
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

