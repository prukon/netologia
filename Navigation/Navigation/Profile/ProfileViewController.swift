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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

    }
    //MARK: - Functions
        
    private func addSubviews(){
        view.addSubview(tableView)
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

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)

return        postFeed.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        Стандартная ячейка
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        var content: UIListContentConfiguration = cell.defaultContentConfiguration()
//     _visibleCells    __NSArrayM *    0 elements    0x00006000002bff90   content.text =  postFeed[indexPath.row].author
//        content.secondaryText =  "123"
//        cell.contentConfiguration = content

//        Кастомная ячейка
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: postFeed[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
    
    

}
extension ProfileViewController: UITableViewDelegate {
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
