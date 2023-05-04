//
//  photosTableSlideViewCell.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 30.04.2023.
//

import UIKit



class PhotosSlideController: UITableViewCell {
    
    //MARK: - Property
    
    var tapHandler: (() -> Void)? = nil
    
    //    var test = "test"
    
    private let postImages = PostImages.maketPost()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var imageArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        collectionView.dataSource = self
        collectionView.register(PhotosSlideCollectionViewCell.self, forCellWithReuseIdentifier: PhotosSlideCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        
        return collectionView
    }()
    
    //    //MARK: - Action
    
    @objc func tapAction() {
        if let action = self.tapHandler { action() }
    }
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    //MARK: - Functions
    
    func setupCell(model: PostImages) {
        postImageView.image = UIImage(named: model.image)
    }
    
    private func addSubviews(){
        contentView.addSubview(collectionView)
        contentView.addSubview(imageArrow)
        contentView.addSubview(headerLabel)
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            //            collectionView
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            //            ImageArrow
            imageArrow.widthAnchor.constraint(equalToConstant: Metric.imageArrowInset),
            imageArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            imageArrow.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            
            //            headerLabel
            headerLabel.topAnchor.constraint(equalTo: topAnchor ,constant: Metric.labelInset),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Metric.labelInset),
        ])
    }
}

//MARK: UICollectionViewDataSource

extension PhotosSlideController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosSlideCollectionViewCell.identifier, for: indexPath) as! PhotosSlideCollectionViewCell
        cell.setupCell(model: postImages[indexPath.row])
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension PhotosSlideController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let   width = (collectionView.bounds.width - 10 * 4) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

extension PhotosSlideController {
    enum Metric {
        static let labelInset: CGFloat = 12
        static let imageInset: CGFloat = 12
        static let imageLeftInset: CGFloat = 8
        static let imageArrowInset: CGFloat = 30
    }
}

extension PhotosSlideController {
    
}
