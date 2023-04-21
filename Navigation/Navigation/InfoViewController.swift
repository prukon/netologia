//
//  InfoViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    //MARK: - Properties
        
    var alertButton: UIButton!
    var returnButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        addButtons()
        setupViews()
        setupContraints()
    }
    
    //MARK: - Functions

    private func addButtons() {
        alertButton = createButton(nameButton: "alertButton", setTitle: "Show Alert", addTarget: #selector(runAlert))
        returnButton = createButton(nameButton: "returnButton", setTitle: "Return", addTarget: #selector(returnScreen))
    }
    
    private func setupViews() {
        view.addSubview(alertButton)
        view.addSubview(returnButton)
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            
//            alertButton
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
            alertButton.widthAnchor.constraint(equalToConstant: 150),
            
//            returnButton
            returnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            returnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            returnButton.heightAnchor.constraint(equalToConstant: 50),
            returnButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    //MARK: - Action
    
    @objc func runAlert() {
        showAlert(title: "Заголовок уведомления", message: "Текст уведомления.")
    }

    @objc func returnScreen() {
        dismiss(animated: true)
    }
}
