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
    private let avatarWrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let wrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        return imageView
    }()
    
    private lazy var closeAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCloseGesture)))
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
    
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    private var heightWrapView = NSLayoutConstraint()
    
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
        addSubview(fullNameLabel)
        addSubview(titleStatus)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(avatarWrapView)
        addSubview(wrapView)
        addSubview(avatarImageView)
        addSubview(closeAvatar)
    }
    
    private func addButtons() {
        setStatusButton = createButton(nameButton: "setStatusButton", setTitle: "Show status", addTarget: #selector(buttonPressed))
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        //                  avatarImageView
        leadingImageView = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topImageView = avatarImageView.topAnchor.constraint(equalTo: topAnchor,constant: 16)
        widthImageView = avatarImageView.widthAnchor.constraint(equalToConstant: 95)
        heightImageView = avatarImageView.heightAnchor.constraint(equalToConstant: 95)
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        //                  wrapView
        heightWrapView = wrapView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([heightWrapView])
        
        NSLayoutConstraint.activate([
            
            //            wrapView
            wrapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wrapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wrapView.topAnchor.constraint(equalTo: topAnchor),
            
            //            closeAvatar
            closeAvatar.widthAnchor.constraint(equalToConstant: 30),
            closeAvatar.heightAnchor.constraint(equalToConstant: 30),
            closeAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeAvatar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            //            avatarWrapView
            avatarWrapView.widthAnchor.constraint(equalToConstant: 95),
            avatarWrapView.heightAnchor.constraint(equalToConstant: 95),
            avatarWrapView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarWrapView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            //            fullNameLabel
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: avatarWrapView.topAnchor ,constant: 0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarWrapView.trailingAnchor,constant: 20),
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
    
    @objc private func tapAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                
                self.widthImageView.constant = UIScreen.main.bounds.width - 60
                self.leadingImageView.constant = 30
                self.trailingImageView.constant = 30
                self.topImageView.constant = 30
                self.heightImageView.constant = UIScreen.main.bounds.height - 220
                self.heightWrapView.constant =  UIScreen.main.bounds.height
                self.avatarImageView.layer.cornerRadius = 0
                self.wrapView.isHidden = false
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                self.closeAvatar.layer.opacity = 1
                self.wrapView.layer.opacity = 0.3

            }
        }
        
    }
    
    @objc private func tapCloseGesture() {
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.closeAvatar.layer.opacity = 0
                self.wrapView.layer.opacity = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.wrapView.isHidden = false
                self.wrapView.isHidden = true
                self.avatarImageView.layer.cornerRadius = 50
                self.widthImageView.constant = 95
                self.leadingImageView.constant = 16
                self.trailingImageView.constant = 30
                self.topImageView.constant = 16
                self.heightImageView.constant = 95
                self.heightWrapView.constant =  UIScreen.main.bounds.height
            }
        }
    }
}

extension ProfileHeaderView {
    enum Metric {
    }
}
