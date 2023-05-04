//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 24.04.2023.
//


//MARK: refactor UITableViewCell
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    var imageView4: UIImageView!
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addImage()
        addSubviews()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        imageView1.image = nil
    //        imageView2.image = nil
    //        imageView3.image = nil
    //        imageView4.image = nil
    //        headerLabel.text = nil
    //        imageArrow.image = nil
    //    }
    
    private func addImage() {
        imageView1 = createImageView(nameImageView: "imageView1", nameImage: "blackCat")
        imageView2 = createImageView(nameImageView: "imageView2", nameImage: "blackDog")
        imageView3 = createImageView(nameImageView: "imageView3", nameImage: "blackMouse")
        imageView4 = createImageView(nameImageView: "imageView4", nameImage: "blackElefant")
    }
    
    private func addSubviews(){
        
        contentView.addSubview(contentWhiteView)
        contentView.addSubview(imageView1)
        contentView.addSubview(imageView2)
        contentView.addSubview(imageView3)
        contentView.addSubview(imageView4)
        contentView.addSubview(headerLabel)
        contentView.addSubview(imageArrow)
        
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {

        let imageSize: CGFloat = contentView.frame.width / 4
            
        NSLayoutConstraint.activate([
            
            //             contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            //            headerLabel
            headerLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor ,constant: Metric.labelInset),
            headerLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor,constant: Metric.labelInset),
            
            //            imageView1
            imageView1.widthAnchor.constraint(equalToConstant: imageSize),
            imageView1.heightAnchor.constraint(equalToConstant: imageSize),
            imageView1.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView1.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor,constant: Metric.imageInset),
            imageView1.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.imageInset),
            
            //            imageView2
            imageView2.widthAnchor.constraint(equalToConstant: imageSize),
            imageView2.heightAnchor.constraint(equalToConstant: imageSize),
            imageView2.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor,constant: Metric.imageLeftInset),
            imageView2.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.imageInset),
            
            //            imageView3
            imageView3.widthAnchor.constraint(equalToConstant: imageSize),
            imageView3.heightAnchor.constraint(equalToConstant: imageSize),
            imageView3.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor,constant: Metric.imageLeftInset),
            imageView3.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.imageInset),
            
            //            imageView4
            imageView4.widthAnchor.constraint(equalToConstant: imageSize),
            imageView4.heightAnchor.constraint(equalToConstant: imageSize),
            imageView4.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor,constant: Metric.imageLeftInset),
            imageView4.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.imageInset),
            
            //            ImageArrow
            imageArrow.widthAnchor.constraint(equalToConstant: Metric.imageArrowInset),
            imageArrow.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -12),
            imageArrow.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor)
        ])
    }
    
    //MARK: - Action
    
    let photosViewController =  {
        PhotosViewController()
    }()
}

extension PhotosTableViewCell {
    func createImageView(nameImageView: String, nameImage: String) -> UIImageView{
        
        let nameImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 3
            imageView.layer.cornerRadius = 6
            imageView.image = UIImage(named: nameImage)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        return nameImageView
    }
}

extension PhotosTableViewCell {
    enum Metric {
        static let labelInset: CGFloat = 12
        static let imageInset: CGFloat = 12
        static let imageLeftInset: CGFloat = 8
        static let imageArrowInset: CGFloat = 30
    }
}
