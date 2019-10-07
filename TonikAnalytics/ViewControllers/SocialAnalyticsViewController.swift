//  Created by Wesley Espinoza on 8/29/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit
import Foundation

class SocialAnalyticsViewController: UIViewController {
    
    var homeFeedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        
        setUpNewsCollectionView()
        view.backgroundColor = .white
    }
    
    
    
    
    
    // Sets up the needed properties for the collectionView
    func setUpNewsCollectionView(){
        // NOTE: set the flowLayput for the colelction view to use
        let flowLayout = UICollectionViewFlowLayout()
        // NOTE: baisc setup for collectionCiew
        homeFeedCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout:flowLayout)
        homeFeedCollectionView.dataSource = self
        homeFeedCollectionView.delegate = self
        homeFeedCollectionView.backgroundColor = .white
        homeFeedCollectionView.register(NewsCVCell.self, forCellWithReuseIdentifier: NewsCVCell.reUseID)
        homeFeedCollectionView.register(FeaturedCVCell.self, forCellWithReuseIdentifier: FeaturedCVCell.reUseID)
        homeFeedCollectionView.register(NewsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsHeaderView.reUseId)
        homeFeedCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // NOTE: add to parent with constraints
        view.add(subview: homeFeedCollectionView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 0),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: p.bounds.height - 70)
            
            ]}
        
    }
    
}


extension SocialAnalyticsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsHeaderView.reUseId, for: indexPath) as! NewsHeaderView
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                headerView.header.text = "What's New?"
                break
            case 1:
                headerView.header.text = "Featured artists"
                break
            case 2:
                headerView.header.text = "Featured Tracks"
                break
            default:
                print("")
            }
            return headerView

        default:
            assert(false, "Unexpected element kind")
        }

        return headerView
    }
    // NOTE: number of cells to return
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        // NOTE: switch statment to return different cells at different indexs
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCVCell.reUseID, for: indexPath)
            break
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCVCell.reUseID, for: indexPath)
            break
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCVCell.reUseID, for: indexPath)
            break
        default:
            cell = UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
        
    }
}

extension SocialAnalyticsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

extension SocialAnalyticsViewController: UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 15 )
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeFeedCollectionView.bounds.width, height: homeFeedCollectionView.bounds.height - 125 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
