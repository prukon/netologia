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
    private var setStatusButton: UIButton!
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
    
    private var titleStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()    //
        textField.backgroundColor = .white //
        textField.layer.borderColor = UIColor.black.cgColor //
        textField.layer.borderWidth = 1.0 //
        textField.layer.cornerRadius = 12 //
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = "Enter your status..."
        textField.textAlignment = .center
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButtons()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Functions
    
    private func addSubviews(){
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(titleStatus)
        addSubview(setStatusButton)
        addSubview(statusTextField)
    }
    
    private func addButtons() {
        setStatusButton = createButton(nameButton: "setStatusButton", setTitle: "Show status", addTarget: #selector(buttonPressed))
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            //            avatarImageView
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            //            fullNameLabel
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor ,constant: 0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            //            titleStatus
            titleStatus.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor,constant: 10),
            titleStatus.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            titleStatus.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            //            statusTextField
            statusTextField.widthAnchor.constraint(equalTo: titleStatus.widthAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor,constant: 15),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            //            setStatusButton
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 15),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor)
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

