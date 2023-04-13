//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class PostViewController: UIViewController {
    var postName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupView()
    }
    
    private func setupView() {
        createCustomNovigationbar()
        let infoRightButton = createCustomButton(
            imageName: "info",
            selector: #selector(infoRightButtonTapped))
        let custoTitleView = createCustomTitleView(contactName: "Лента новостей", contactDescription: "\(postName ?? "Новый пост")", contactImage: "square.and.arrow.up.circle.png")
        navigationItem.rightBarButtonItems = [infoRightButton]
        navigationItem.titleView = custoTitleView
    }
    @objc private func infoRightButtonTapped() {
        let infoViewController = InfoViewController()
        //Модальный переход
        present(infoViewController,animated: true)
    }
}


