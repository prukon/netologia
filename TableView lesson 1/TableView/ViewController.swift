//
//  ViewController.swift
//  TableView
//
//  Created by Shishkin Ivan Sergeevich on 17.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private var carModel = CarModel.makeMockModel()
    
    private var isNeedUpdate: Bool = false
    private var indexPathForUpdate = IndexPath()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard isNeedUpdate else { return }
        updateRows()
        isNeedUpdate = false
    }
    
    private func updateRows() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self else { return }
            self.tableView.reloadRows(at: [self.indexPathForUpdate], with: .left)
        }
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        carModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        var content: UIListContentConfiguration = cell.defaultContentConfiguration()
//        content.text = carModel[indexPath.row].name
//        content.secondaryText = "Секция \(indexPath.section) ячейка \(indexPath.row)"
//        cell.contentConfiguration = content
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//        let section: [CarModel] = carModel[indexPath.section]
//        let car: CarModel = section[indexPath.row]
        cell.setupCell(model: carModel[indexPath.section][indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("table.frame = \(tableView.frame)")
//        print("table.bounds = \(tableView.bounds)")
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CustomHeaderView()
        header.setupHeader(text: "Это хедер секции \(section)")
        return header
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        section % 2 == 0 ? 100 : 50
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = CustomHeaderView()
        footer.setupHeader(text: "Это футер секции \(section)")
        return footer
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
            carModel[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Секция = \(indexPath.section), ячейка = \(indexPath.row)")
        let detailVC = DetailViewController()
        detailVC.setupVC(model: carModel[indexPath.section][indexPath.row], indexPath: indexPath)
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: DetailViewControllerDelegate {
    func changeText(_ text: String, at indexPath: IndexPath) {
        carModel[indexPath.section][indexPath.row].description = text
        isNeedUpdate = true
        indexPathForUpdate = indexPath
    }
}
