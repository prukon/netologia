//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 24.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    
    private let postFeed = Post.maketPost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PhotosSlideController.self, forCellReuseIdentifier: PhotosSlideController.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupContraints()
        
//        let photosSlideController = PhotosSlideController()
    
//        photosSlideController.tapHandler = { [weak self] in
//            self?.navigationController?.pushViewController(PhotosViewController(), animated: true)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.reloadData()
        navigationController?.navigationBar.isHidden = true
    
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        if let nav = parentNavigationController {nav.navigationBar.isHidden = true}
//    }
    //MARK: - Functions
    
    private func addSubviews(){
        view.addSubview(tableView)
    }
    
    
    func pushPhotosViewController() {
        let photosVC = PhotosViewController()
        photosVC.parentNavigationControler = self.navigationController
        navigationController?.pushViewController(photosVC, animated: true)
        
    }
    //MARK: - Constraints
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//MARK: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0   {
            return 1
        }
        else {
            return  postFeed.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosSlideController.identifier, for: indexPath) as! PhotosSlideController
                cell.tapHandler = pushPhotosViewController
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postFeed[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        } else {
            return nil
        }
    }
    
    //MARK: refactor
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let photosViewController = PhotosViewController()
//        if indexPath.section == 0 {
//            navigationController?.pushViewController(photosViewController, animated: true)
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return tableView.rowHeight
    }
}

//MARK: UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
}

//MARK: UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
