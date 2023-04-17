//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 13.04.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    //MARK: - Properties
    
    private var statusLabel: String = ""
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(ProfileHeaderView.self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private var titleStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        let placeholderText = "Write your status..."
        let placeholderAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                                     NSAttributedString.Key.paragraphStyle: { let style = NSMutableParagraphStyle()
            style.alignment = .center
            textField.translatesAutoresizingMaskIntoConstraints = false
            return style
        }()]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return textField
    }()
    
    //MARK: - inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
    
    //MARK: - Functions
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupContraints()
    }

    private func addSubviews(){
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(titleStatus)
        addSubview(setStatusButton)
        addSubview(statusTextField)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
           
//            avatarImageView
            avatarImageView.widthAnchor.constraint(
                equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(
                equalToConstant: 100),
            avatarImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16),
            avatarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16),
            
//            fullNameLabel
            fullNameLabel.widthAnchor.constraint(
                equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 27),
            fullNameLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: 20),
            
//            titleStatus
            titleStatus.widthAnchor.constraint(
                equalToConstant: 100),
            titleStatus.topAnchor.constraint(
                equalTo: fullNameLabel.bottomAnchor,
                constant: 10),
            titleStatus.leadingAnchor.constraint(
                equalTo: fullNameLabel.leadingAnchor),
            
//            setStatusButton
            setStatusButton.heightAnchor.constraint(
                equalToConstant: 50),
            setStatusButton.topAnchor.constraint(
                equalTo: statusTextField.bottomAnchor,
                constant: 15),
            setStatusButton.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            setStatusButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16),
            setStatusButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16),
            
//            statusTextField
            statusTextField.widthAnchor.constraint(
                equalTo: titleStatus.widthAnchor),
            statusTextField.heightAnchor.constraint(
                equalToConstant: 50),
            statusTextField.topAnchor.constraint(
                equalTo: titleStatus.bottomAnchor,
                constant: 15),
            statusTextField.leadingAnchor.constraint(
                equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16),
        ])
    }
    
    //MARK: - Action
    @objc func buttonPressed() {
        titleStatus.text = statusLabel
        if titleStatus.text  == "" {
            titleStatus.text = "Enter the status..."
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let titleStatus = textField.text {
            statusLabel = titleStatus
        }
    }
}
