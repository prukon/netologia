//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    
    private let profileHeaderView = {
        let  view =  ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let openPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        title = "Profile"
        
        addSubviews()
        setupContraints()
    }
    
    //MARK: - Functions
    
    private func addSubviews() {
        view.addSubview(profileHeaderView)
        view.addSubview(openPostButton)
    }
    
    //MARK: - Constraints
    
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
        ])
    }
}
