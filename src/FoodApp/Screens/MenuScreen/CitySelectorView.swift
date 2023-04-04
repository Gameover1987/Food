
import UIKit

final class CitySelectorView : UIView {
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
    
    func arrange() {
        backgroundColor = Colors.menuBackground
        
        addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(16)
            make.top.equalTo(self).offset(8)
        }
        
        addSubview(dropDownImage)
        dropDownImage.snp.makeConstraints { make in
            make.left.equalTo(cityLabel.snp.right).offset(8)
            make.top.equalTo(self).offset(16)
        }
    }
}
