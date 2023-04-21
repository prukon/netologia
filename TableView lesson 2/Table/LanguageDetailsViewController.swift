import UIKit

class LanguageDetailsViewController: UIViewController {
    
    // MARK: - Data
    
    private var data: Language? = nil
    
    // MARK: - Public
    
    func update(model: Language) {
        data = model
        
        navigationItem.title = model.name
        view.backgroundColor = model.color
    }
}
