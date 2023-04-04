
import UIKit

final class FoodTableViewCell : UITableViewCell {
    
    static let identifier = "FoodTableViewCell"
    
    private lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var foodTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = Int.random(in: 1...4)
        return label
    }()
    
    private lazy var buyFoodButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.tintColor = Colors.tabBarTint
        button.setTitleColor(Colors.tabBarTint, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.layer.borderColor = Colors.tabBarTint.cgColor
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(foodImageView)
        foodImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.top.equalTo(contentView).offset(16)
            make.width.equalTo(132)
            make.height.equalTo(132)
        }
        
        contentView.addSubview(foodTitleLabel)
        foodTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(foodImageView.snp.rightMargin).offset(32)
            make.top.equalTo(contentView).offset(16)
            make.right.equalTo(contentView).offset(-16)
        }
        
        contentView.addSubview(foodDescriptionLabel)
        foodDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(foodImageView.snp.rightMargin).offset(32)
            make.top.equalTo(foodTitleLabel.snp.bottom).offset(8)
            make.right.equalTo(contentView).offset(-16)
        }
        
        contentView.addSubview(buyFoodButton)
        buyFoodButton.snp.makeConstraints { make in
            make.top.equalTo(foodDescriptionLabel.snp.bottom).offset(8)
            make.right.equalTo(contentView).offset(-16)
            make.width.equalTo(87)
            make.height.equalTo(32)
        }
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(by food: FoodViewModel) {
        foodImageView.downloaded(from: food.imageUrl)
        foodTitleLabel.text = food.title
        foodDescriptionLabel.text = food.description
        buyFoodButton.setTitle("от \(food.price)", for: .normal)
    }
}
