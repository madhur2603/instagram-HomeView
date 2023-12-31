//
//  HomeView.swift
//  Instagram
//
//  Created by iOS on 30/12/23.
//

import UIKit

class HomeView: UICollectionViewCell {
    
    static let cell = "HomeView"
    var imageHeight: NSLayoutConstraint!
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "save"), for: .normal)
        //        button.addTarget(self, action: #selector(handleMoreButton), for: .touchUpInside)
        return button
    }()
    
    lazy var profileView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "profile")
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "more"), for: .normal)
        return button
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Madhubalan R"
        return label
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    lazy var shareBtn : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var messageButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "message"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var likeButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "love"), for: .normal)
        //        button.addTarget(self, action: #selector(handleLikeButton), for: .touchUpInside)
        //        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender: )))
        //        lpgr.minimumPressDuration = 0.5
        //        button.addGestureRecognizer(lpgr)
        //        button.backgroundColor = .clear
        return button
    }()
    
    let likeCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "999 likes"
        return label
    }()
    
    let textLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "in cell autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the cell."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let commentCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "View all 13 comments"
        label.textColor = .gray
        return label
    }()
    
    let timeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.text = "6 hours ago"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.screenWidth).isActive = true
        self.contentView.addSubview(mainView)
        addViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addViews() {
        mainView.addSubview(imageView)
        mainView.addSubview(saveButton)
        mainView.addSubview(usernameLabel)
        mainView.addSubview(likeCount)
        mainView.addSubview(profileView)
        mainView.addSubview(moreButton)
        mainView.addSubview(textLbl)
        configureHorizontalStackView()
        mainView.addSubview(horizontalStackView)
        mainView.addSubview(commentCount)
        mainView.addSubview(timeLbl)
//        mainView.addSubview(textLbl)
    }
    
    fileprivate func configureHorizontalStackView() {
        horizontalStackView.addArrangedSubview(likeButton)
        horizontalStackView.addArrangedSubview(messageButton)
        horizontalStackView.addArrangedSubview(shareBtn)
    }
    
    fileprivate func setupLayout() {
        
        // mainView constraints
        NSLayoutConstraint.activate([
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // profileView constraints
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            profileView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            profileView.widthAnchor.constraint(equalToConstant: 40),
            profileView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        imageHeight = imageView.heightAnchor.constraint(equalToConstant: 100)
        imageHeight.isActive = true // Activate the imageHeight constraint
        
        // imageView constraints
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor)
        ])
        
        // moreButton constraints
        NSLayoutConstraint.activate([
            moreButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            moreButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            moreButton.heightAnchor.constraint(equalToConstant: 25),
            moreButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        // usernameLabel constraints
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: 15),
            usernameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            usernameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 25),
            usernameLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        // horizontalStackView constraints
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            horizontalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 25),
            horizontalStackView.widthAnchor.constraint(equalToConstant: 130),
        ])
        
        // saveButton constraints
        NSLayoutConstraint.activate([
            saveButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            saveButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            saveButton.heightAnchor.constraint(equalToConstant: 25),
            saveButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        // likeCount constraints
        NSLayoutConstraint.activate([
            likeCount.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            likeCount.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 10),
            likeCount.heightAnchor.constraint(equalToConstant: 25),
            likeCount.widthAnchor.constraint(equalToConstant: 150),
        ])
        // textLbl constraints
        NSLayoutConstraint.activate([
            textLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            textLbl.topAnchor.constraint(equalTo: likeCount.bottomAnchor, constant: 0),
            textLbl.heightAnchor.constraint(equalToConstant: 50),
            textLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
        ])
        // commentCount constraints
        NSLayoutConstraint.activate([
            commentCount.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            commentCount.topAnchor.constraint(equalTo: textLbl.bottomAnchor, constant: 0),
            commentCount.heightAnchor.constraint(equalToConstant: 25),
            commentCount.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
        ])
        
        // timeLbl constraints
        NSLayoutConstraint.activate([
            timeLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            timeLbl.topAnchor.constraint(equalTo: commentCount.bottomAnchor, constant: 0),
            timeLbl.heightAnchor.constraint(equalToConstant: 25),
            timeLbl.widthAnchor.constraint(equalToConstant: 200),
            timeLbl.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
        
        self.bringSubviewToFront(horizontalStackView)
    }
    
    func confic(imgName: String){
        self.imageView.image = UIImage(named: imgName)
        let heights = self.imageView.image!.size.height
        let width = self.imageView.image!.size.width
        let aspectRatio = width / heights
        let calculatedHeight = (self.contentView.frame.width - 22) / aspectRatio
        self.imageHeight.isActive = false
        imageHeight = imageView.heightAnchor.constraint(equalToConstant: calculatedHeight)
        imageHeight.isActive = true
    }
}

func height(height: String,width: String) -> CGFloat{
    let width = CGFloat(truncating: NumberFormatter().number(from: width)!)
    let height = CGFloat(truncating: NumberFormatter().number(from: height)!)
    let heightOnWidthRatio = width / height
    let heights = (UIScreen.screenWidth - 42) / heightOnWidthRatio
    return heights
}
