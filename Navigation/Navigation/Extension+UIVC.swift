//
//  Extension+UIVC.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 08.04.2023.
//

import UIKit

extension UIViewController {
    func createCustomNovigationbar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.isHidden = true
    }
    
    func createCustomTitleView(contactName: String, contactDescription: String, contactImage: String) ->  UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)

        let imageContact = UIImageView()
        imageContact.image = UIImage(named: contactImage)
        imageContact.layer.cornerRadius = imageContact.frame.height / 2
        imageContact.frame = CGRect(x: 8, y: 8, width: 24, height: 24)
        view.addSubview(imageContact)
        
        
        let nameLabel = UILabel()
        nameLabel.text = contactName
        nameLabel.frame = CGRect(x: 55, y: 0, width: 220, height: 20)
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(nameLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = contactDescription
        descriptionLabel.frame = CGRect(x: 55, y: 21, width: 220, height: 20)
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.textColor = .gray
        view.addSubview(descriptionLabel)

        return view
    }
    
    func createButton(nameButton: String, setTitle: String, addTarget:  Selector) -> UIButton {
        let nameButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(setTitle, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 15
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowOpacity = 0.2
            button.layer.shadowRadius = 10
            button.layer.shadowColor = UIColor.black.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: addTarget, for: .touchUpInside)
            return button
        }()
        return nameButton        
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.imageView?.tintColor = .systemRed
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            print("Ок")
        }
        let okCancel = UIAlertAction(title: "Cancel", style: .default) {_ in
            print("Cancel")
        }
        alert.addAction(okAction)
        alert.addAction(okCancel)
        present(alert, animated: true)  // вывод алерта
    }
}

extension UIView {
    func createButton(nameButton: String, setTitle: String, addTarget:  Selector) -> UIButton {
        let nameButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(setTitle, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 15
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowOpacity = 0.2
            button.layer.shadowRadius = 10
            button.layer.shadowColor = UIColor.black.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: addTarget, for: .touchUpInside)
            return button
        }()
        return nameButton
    }
}
