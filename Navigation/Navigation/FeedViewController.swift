//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    let postName: Post = .init(title: "Пост №1")
    var postButton: UIButton!
    var postButton2: UIButton!

    private let stackViewButtons: UIStackView = {
       let UIStackView = UIStackView()
        UIStackView.axis = .vertical
        UIStackView.spacing = 10
        UIStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return UIStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Feed"
        addButtons()
        addSubviews()
        setupContraints()
    }
    
    //MARK: - Functions
    
    private func addButtons() {
        postButton = createButton(nameButton: "postButton1", setTitle: "Show Post", addTarget: #selector(showPost))
        postButton2 = createButton(nameButton: "postButton2", setTitle: "Show Post", addTarget: #selector(showPost))
    }
    
    private func addSubviews() {
        view.addSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(postButton)
        stackViewButtons.addArrangedSubview(postButton2)
    }
    
    //MARK: - Constraints

    private func setupContraints() {
        NSLayoutConstraint.activate([
           
            //stackViewButtons
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
        //немодальный переход
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
