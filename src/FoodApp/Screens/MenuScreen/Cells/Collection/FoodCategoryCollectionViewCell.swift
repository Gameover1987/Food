
import UIKit

final class FoodCategoryCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "FoodCategoryCollectionViewCell"
    
    static let size = CGSize(width: 88, height: 32)
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.categoryText
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.center.equalTo(contentView)
        }
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = Colors.categoryBorder.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(category: String) {
        categoryLabel.text = category
    }
    
    func select() {
        backgroundColor = Colors.selectedCategoryBackground
        categoryLabel.textColor = Colors.selectedCategoryText
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 17)
        layer.borderWidth = 0
    }
    
    func deselect() {
        backgroundColor = .clear
        categoryLabel.textColor = Colors.categoryText
        categoryLabel.font = UIFont.systemFont(ofSize: 13)
        layer.borderWidth = 1
    }
}
