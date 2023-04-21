import UIKit

class TableSectionFooterHeaderView: UITableViewHeaderFooterView {

    // MARK: - Subviews
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()

    // MARK: - Lifecycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        tuneView()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func update(title: String) {
        titleLabel.text = title
    }
    
    // MARK: - Private
    
    private func tuneView() {
        contentView.backgroundColor = .systemGray6
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20.0
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo:contentView.trailingAnchor
            ),
            titleLabel.heightAnchor.constraint(
                equalToConstant: 30.0
            ),
            titleLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
        ])
    }
}
