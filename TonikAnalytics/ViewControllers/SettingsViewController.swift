//  Created by Wesley Espinoza on 9/10/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//

import UIKit
import Foundation

struct SettingsContent {
    let imageName: String!
    let title: String!
    let text: String!
}

class SettingsViewController: UICollectionViewController {
    enum Sections: String {
        case subscription
        case helpandsupport = "Help & Support"
        case account = "Account"
        case notification = "Notification"
        case others = "Others"
        static var all: [Sections] {
            return [.subscription, .helpandsupport, .account, .notification, .others]
        }
    }
    
    let settingsContent: [SettingsContent] = [
    SettingsContent(imageName: "subscription", title: "Monthly Subscription", text: "Apply for monthly subsciption for more features"),
    SettingsContent(imageName: "faq", title: "FAQ", text: "Maybe we've answered your question, Here's our FAQs"),
    SettingsContent(imageName: "notification", title: "Push Notification", text: ""),
    SettingsContent(imageName: "email", title: "Update Email", text: ""),
    SettingsContent(imageName: "password", title: "Change Password", text: ""),
    SettingsContent(imageName: "logout", title: "Logout", text: ""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionViewComponents()
        
    }

    private func setupCollectionViewComponents() {
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: SettingsCollectionViewCell.cellId)
        collectionView.register(SettingsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SettingsHeaderView.cellId)
        
        
    }
    
}

/*
 NOTE: (UICollectionViewDataSource) this is responsible for providing the data and views required by a collection view. A data source object represents
 your app’s data model and vends information to the collection view as needed. It also handles the creation and
 configuration of cell and supplementary views used by the collection view to display your data.
 */
extension SettingsViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        let num = Sections.all.count
        return num
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SettingsHeaderView.cellId, for: indexPath) as! SettingsHeaderView
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 1:
                headerView.header.text = Sections.helpandsupport.rawValue
                break
            case 2:
                headerView.header.text = Sections.notification.rawValue
                break
            case 3:
                headerView.header.text = Sections.account.rawValue
            case 4:
                headerView.header.text = Sections.others.rawValue
            default:
                print("")
            }
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
        
        return headerView
        
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCollectionViewCell.cellId, for: indexPath) as! SettingsCollectionViewCell
        
        cell.imageView.image = UIImage(named: settingsContent[indexPath.row].imageName)
        cell.titleLabel.text = settingsContent[indexPath.row].title
        cell.textLabel.text = settingsContent[indexPath.row].text
        
    
        return cell
    }
}


/*
 NOTE: (UICollectionViewDelegateFlowLayout) methods that let you coordinate with a UICollectionViewFlowLayout object to implement a grid-based layout. The methods of this protocol define the size of items and the spacing between items in the grid.
 */
extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sections = Sections.all
        
        switch sections[section] {
            
        case .subscription:
            return 1
        case .helpandsupport:
            return 1
        case .account:
            return 3
        case .notification:
            return 1
        case .others:
            return 1
        }
        
    }
    
    // NOTE: header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 20)
    }
    
    // NOTE: spacing for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // NOTE: size for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 + 175, height: view.frame.height / 2 - 300)
    }
    
    // NOTE: insets for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
}
