//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 26.04.2023.
//

import UIKit

final class PhotosSlideCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Property
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        custmizeCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    private func custmizeCell() {
    }
    
    func setupCell(model: PostImages) {
        postImageView.image = UIImage(named: model.image)
    }
    
    private func addSubviews(){
        contentView.addSubview(postImageView)
       
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
}
