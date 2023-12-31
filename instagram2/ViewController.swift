//
//  ViewController.swift
//  Instagram
//
//  Created by Madhu on 30/12/23.
//

import UIKit

class ViewController: UIViewController {
  
    var collectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    lazy var refreshControl = UIRefreshControl()
    lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    let storyView = StoryViewController()
    let array = ["img1","img2","img3","img4","img5","img6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.estimatedItemSize = .init(width: UIScreen.screenWidth, height: 200)
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeView.self, forCellWithReuseIdentifier: HomeView.cell)
//        collectionView.register(StoryView.self, forCellWithReuseIdentifier: StoryView.cell)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: HomeView.cell, for: indexPath) as! HomeView
//            cell.backgroundColor = .white
            cell.confic(imgName: array[indexPath.row])
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
           header.backgroundColor = .clear
            storyView.view.frame = header.bounds
            self.addChild(storyView)
           header.addSubview((storyView.view)!)
           storyView.didMove(toParent: self)
           return header
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.screenWidth, height: 110)
    }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

class HeaderCollectionReusableView: UICollectionReusableView {
       
   static let identifier = "HeaderCollectionReusableView"
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
