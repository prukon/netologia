//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Properties

    let postName: Post = .init(title: "Пост №1")

    private let postButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return button
    }()
    
    private let postButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Post2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return button
    }()
    
    private let stackViewButtons: UIStackView = {
       let UIStackView = UIStackView()
        UIStackView.axis = .vertical
        UIStackView.spacing = 10
        
        return UIStackView
    }()
    
    private let profileHeaderView = {
        let  view =  ProfileHeaderView()
        return view
    }()
    
    private let openPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        
        translatesAutoresizingMaskIntoConstraints()
        addSubviews()
        setupContraints()
    }
    
    //MARK: - Functions

    private func translatesAutoresizingMaskIntoConstraints () {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        openPostButton.translatesAutoresizingMaskIntoConstraints = false
        stackViewButtons.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        view.addSubview(profileHeaderView)
        view.addSubview(openPostButton)
        stackViewButtons.addArrangedSubview(postButton)
        stackViewButtons.addArrangedSubview(postButton2)
        view.addSubview(stackViewButtons)

    }
        
    private func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
           
            //profileHeaderView
            profileHeaderView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            
            profileHeaderView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor),
            
            profileHeaderView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0),
            
            profileHeaderView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0),
            
            profileHeaderView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 0),
            profileHeaderView.heightAnchor.constraint(
                equalToConstant: 220),
            
            //openPostButton
            openPostButton.heightAnchor.constraint(
                equalToConstant: 50),
            
            openPostButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0),
            
            openPostButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0),
            
            openPostButton.bottomAnchor.constraint(
                equalTo: safeAreaGuide.bottomAnchor,
                constant: 0),
            
            stackViewButtons.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            
            stackViewButtons.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),

        ])
    }
    
    //MARK: - Action
    
    @objc func showPost () {
        let postViewController = PostViewController()
        postViewController.postName = postName.title
        //немодальное переход
        navigationController?.pushViewController(postViewController, animated: true)
    }
}



