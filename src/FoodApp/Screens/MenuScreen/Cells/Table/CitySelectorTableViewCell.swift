
import UIKit

final class CitySelectorTableViewCell : UITableViewCell {
    
    static let identifier = "CitySelectorTableViewCell"
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var dropDownImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DropDown")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = Colors.menuBackground
        
        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(16)
            make.top.equalTo(contentView).offset(8)
        }
        
        contentView.addSubview(dropDownImage)
        dropDownImage.snp.makeConstraints { make in
            make.left.equalTo(cityLabel.snp.right).offset(8)
            make.top.equalTo(contentView).offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
