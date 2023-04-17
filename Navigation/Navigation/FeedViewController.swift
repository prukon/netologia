//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
//    private let postButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Show Post", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .gray
//        return button
//    }()
    
//    let postName: Post = .init(title: "Пост №1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        
//        setupViews(button: postButton)
//        setConstraints(button: postButton)
//        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
    }
    
//    @objc func showPost () {
//        let postViewController = PostViewController()
//        postViewController.postName = postName.title
//        //немодальное переход
//        navigationController?.pushViewController(postViewController, animated: true)
//    }
}


