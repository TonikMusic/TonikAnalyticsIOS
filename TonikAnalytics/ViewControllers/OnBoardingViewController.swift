//  Created by Maximo Hinojosa on 9/27/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import UIKit


struct OnBoardingContent {
    let imgName: String!
    let text: String!
}

class OnBoardingViewController: UICollectionViewController {
    
    
    private let pages: [OnBoardingContent] = [
        OnBoardingContent.init(imgName: "onBoarding1", text: "Check out the latest news and upcoming artist"),
        OnBoardingContent.init(imgName: "onBoarding2", text: "Interact with your community through post and keep them updated!"),
        OnBoardingContent.init(imgName: "onBoarding3", text: "Switch over to the songs section to quickly add or remove a song or album"),
        OnBoardingContent.init(imgName: "onBoarding4", text: "Edit your account through the settings tab")
    ]
    
    private let previousButton = Button.customButton(title: "Prev", titleColor: #colorLiteral(red: 0.2987159569, green: 0.3016735406, blue: 0.3016735406, alpha: 1), cornerRadius: 0, backgroundColor: .clear)
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.4, green: 0.137254902, blue: 0.8196078431, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.6146181841, green: 0.4736413815, blue: 0.9775631096, alpha: 1)
        return pc
    }()
    
    private let nextButton = Button.customButton(title: "Next", titleColor: #colorLiteral(red: 0.4, green: 0.137254902, blue: 0.8196078431, alpha: 1), cornerRadius: 0, backgroundColor: .clear)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionViewComponents()
        setupBottomView()
        previousButton.addTarget(self, action: #selector(didPressPrevious), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didPressNext), for: .touchUpInside)
    }
    
    
    private func setupCollectionViewComponents() {
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(OnBoardingPageCell.self, forCellWithReuseIdentifier: OnBoardingPageCell.cellId)
        collectionView.isPagingEnabled = true
    }
    
    private func setupBottomView() {
        let bottomControlStackView = Stack.createStackView(with: [previousButton, pageControl, nextButton], alignment: .center, distribution: .fillEqually, axis: .horizontal, spacing: 0)
        
        view.add(subview: bottomControlStackView) { (v, p) in [
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor),
            v.heightAnchor.constraint(equalToConstant: 50)
            ]}
    }
    
    @objc private func didPressPrevious() {
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if pageControl.currentPage < 3 {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    // NOTE: This method tells the delegate when the user finishes scrolling the content
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    @objc private func didPressNext() {
        if nextButton.currentTitle == "Done" {
        
            let tabVC = TabBarController()
            self.navigationController?.pushViewController(tabVC, animated: true)
        }
        nextPage()
        if pageControl.currentPage == 3 {
            nextButton.setTitle("Done", for: .normal)
        }
        

    }
    
    private func nextPage() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}

/*
 NOTE: (UICollectionViewDataSource) this is responsible for providing the data and views required by a collection view. A data source object represents
 your app’s data model and vends information to the collection view as needed. It also handles the creation and
 configuration of cell and supplementary views used by the collection view to display your data.
 */
extension OnBoardingViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnBoardingPageCell
        cell.onBoardingImg.image = UIImage(named: pages[indexPath.row].imgName!)
        cell.onBoardingLabel.text = pages[indexPath.row].text
        
        return cell
    }
}


/*
 NOTE: (UICollectionViewDelegateFlowLayout) methods that let you coordinate with a UICollectionViewFlowLayout object to implement a grid-based layout. The methods of this protocol define the size of items and the spacing between items in the grid.
 */
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.bounds.height - 100)
    }
    
}
