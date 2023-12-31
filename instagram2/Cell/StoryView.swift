//
//  StoryView.swift
//  instagram2
//
//  Created by Madhu on 30/12/23.
//

import UIKit

class StoryView: UICollectionViewCell {
    
    static let cell = "StoryView"
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "profile")
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    lazy var plusView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "plusIcon")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let nameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "madhu"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.contentView.addSubview(mainView)
        addViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addViews() {
        mainView.addSubview(imageView)
        mainView.addSubview(nameLbl)
        mainView.addSubview(plusView)
    }
    
    fileprivate func setupLayout() {
        
        // profileView constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 2),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        // profileView constraints
        NSLayoutConstraint.activate([
            plusView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -25),
            plusView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 7),
            plusView.widthAnchor.constraint(equalToConstant: 20),
            plusView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        // nameLbl constraints
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            nameLbl.heightAnchor.constraint(equalToConstant: 10),
            nameLbl.widthAnchor.constraint(equalToConstant: 100),
            nameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)
        ])
        
    }
    
    func confic(imgName: String){
        self.imageView.image = UIImage(named: imgName)
    }
}
