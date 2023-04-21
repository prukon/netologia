//
//  CustomHeaderView.swift
//  TableView
//
//  Created by Shishkin Ivan Sergeevich on 19.04.2023.
//

import UIKit

final class CustomHeaderView: UIView {
    
    private let headerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .brown
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader(text: String) {
        headerTextLabel.text = text
    }
    
    private func layout() {
        addSubview(headerTextLabel)
        
        NSLayoutConstraint.activate([
            headerTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: .inset),
            headerTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .inset),
            headerTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.inset),
            headerTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.inset)
        ])
    }
}

private extension CGFloat {
    static let inset: CGFloat = 16
}
