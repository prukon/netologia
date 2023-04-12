//
//  ProfileViewController.swift
//  Базовые UI компоненты lesson4
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Profile"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let button = UIButton(type: .system)
//        button.isUserInteractionEnabled = true
        button.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 150, height: 30))
        button.setTitle("Show Detail", for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }
   
  @objc func showDetails () {
       let detailViewController = DetailsInfoViewController()
      
      //немодальное переход
      navigationController?.pushViewController(detailViewController, animated: true)
      
      //модальный переход
//      present(detailViewController,animated: true)
    }
}
