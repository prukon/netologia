//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class PostViewController: UIViewController {
   
    //MARK: - Properties
    
    struct Post {
        let author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }
    
    var post1: Post = .init(author: "John", description: "Веселый слоник", image: "elefant", likes: 22, views: 41)
    var post2: Post = .init(author: "Bob", description: "Веселый котик", image: "cat", likes: 25, views: 61)
    var post3: Post = .init(author: "Emily", description: "Веселая собачка", image: "dog", likes: 32, views: 55)
    var post4: Post = .init(author: "Kate", description: "Веселая мышка", image: "mouse", likes: 11, views: 15)

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
