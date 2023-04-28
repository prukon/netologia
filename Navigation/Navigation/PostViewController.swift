//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class PostViewController: UIViewController {
   
    //MARK: - Properties
    var postName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupView()
    }
    
    //MARK: - Functions

    private func setupView() {
        createCustomNovigationbar()
     
        let infoRightButton = createCustomButton(
            imageName: "info",
            selector: #selector(infoRightButtonTapped))
        
        let customTitleView = createCustomTitleView(contactName: "Лента новостей", contactDescription: "\(postName ?? "Новый пост")", contactImage: "newspaper 1")
        
        navigationItem.rightBarButtonItems = [infoRightButton]
        navigationItem.titleView = customTitleView
    }
    
    //MARK: - Action

    @objc private func infoRightButtonTapped() {
        let infoViewController = InfoViewController()
        //Модальный переход
        present(infoViewController,animated: true)
    }
}
