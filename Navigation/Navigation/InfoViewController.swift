//
//  InfoViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        return button
    }()
    
    
    private let returnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Return", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        setupViews(button: alertButton)
        setupViews(button: returnButton)
        
        alertButton.addTarget(self, action: #selector(runAlert), for: .touchUpInside)
        returnButton.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        setConstraints(button: alertButton)
        setConstraintsReturn(button: returnButton)
        
    }
    
    @objc func runAlert() {
        showAlert(title: "Заголовок уведомления", message: "Текст уведомления.")
    }
    
    @objc func returnScreen() {
        dismiss(animated: true)
    }
}
