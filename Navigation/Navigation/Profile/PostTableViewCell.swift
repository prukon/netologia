//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 24.04.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Property
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
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
    
    //MARK: - Functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        authorText.text = nil
        descriptionText.text = nil
        likes.text = nil
        views.text = nil
    }
    
    func setupCell(model: Post) {
        postImageView.image = UIImage(named: model.image)
        authorText.text = model.author
        descriptionText.text = model.description
        likes.text = "Likes: " + String( model.likes)
        views.text = "Views: " + String(model.views)
    }
    
    private func addSubviews() {
        [contentWhiteView, authorText,postImageView, descriptionText, likes, views].forEach { contentView.addSubview($0)
        }
    }
    
    //MARK: - Constraints

    private func setupContraints() {
        
        let imageInset: CGFloat = 15
        let textInset: CGFloat = 20
        
        NSLayoutConstraint.activate([
            // contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // authorText
            authorText.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: 15),
            authorText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            authorText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: 200),
            authorText.heightAnchor.constraint(equalToConstant: 30),
            
            //postImageView
            postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: imageInset),
            postImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // descriptionText
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            descriptionText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: 50),
            
            // likes
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor),
            
            // views
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -textInset),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
}
