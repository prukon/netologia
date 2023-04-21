//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Shishkin Ivan Sergeevich on 17.04.2023.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let carText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray4
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray4
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carImageView.image = nil
        carText.text = nil
        descriptionText.text = nil
    }
    
    func setupCell(model: CarModel) {
        carImageView.image = model.image
        carText.text = model.name
        descriptionText.text = model.description
    }
    
    private func customizeCell() {
//        contentView.backgroundColor = .blue
        contentWhiteView.layer.cornerRadius = 10
        contentWhiteView.layer.borderColor = UIColor.black.cgColor
        contentWhiteView.layer.borderWidth = 2
    }
    
    private func layout() {
        [contentWhiteView, carImageView, carText, descriptionText].forEach { contentView.addSubview($0) }
        
        let viewInset: CGFloat = 8
        let imageInset: CGFloat = 10
        let textInset: CGFloat = 16
        let heightView: CGFloat = 100
        
        NSLayoutConstraint.activate([
            // contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            
            //carImageView
            carImageView.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: imageInset),
            carImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: imageInset),
            carImageView.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -imageInset),
            carImageView.widthAnchor.constraint(equalToConstant: heightView - imageInset * 2),
            
            // carText
            carText.topAnchor.constraint(equalTo: carImageView.topAnchor),
            carText.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: textInset),
            carText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -textInset),
            
            // descriptionText
            descriptionText.topAnchor.constraint(equalTo: carText.bottomAnchor, constant: textInset),
            descriptionText.leadingAnchor.constraint(equalTo: carText.leadingAnchor),
            descriptionText.trailingAnchor.constraint(equalTo: carText.trailingAnchor),
            descriptionText.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -imageInset)
        ])
    }
}
