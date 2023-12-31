//
//  StoryViewController.swift
//  instagram2
//
//  Created by iOS on 31/12/23.
//

import UIKit

class StoryViewController: UIViewController {

    var collectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
      
    let array = ["img1","img2","img3","img4","img5","img6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .init(width: UIScreen.screenWidth, height: 200)
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(HomeView.self, forCellWithReuseIdentifier: HomeView.cell)
        collectionView.register(StoryView.self, forCellWithReuseIdentifier: StoryView.cell)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
    }

}

extension StoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: StoryView.cell, for: indexPath) as! StoryView
//            cell.backgroundColor = .red
        cell.confic(imgName: array[indexPath.row])
        if indexPath.row == 0{
            cell.plusView.isHidden = false
        }else{
            cell.plusView.isHidden = true
        }
            return cell

    }
}
