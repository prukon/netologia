import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var buttonTapCallback: () -> () = {}
    
    // MARK: - Subviews
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Tap me!", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapButton(_:)),
            for: .touchUpInside
        )
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )

        tuneView()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func tuneView() {
        contentView.backgroundColor = .systemBlue
        accessoryType = .none
    }
    
    private func addSubviews() {
        contentView.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            button.widthAnchor.constraint(equalToConstant: 88.0),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton(_ sender: UIResponder) {
        buttonTapCallback()
    }
}
