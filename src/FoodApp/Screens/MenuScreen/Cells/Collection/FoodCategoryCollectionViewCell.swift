
import UIKit

final class FoodCategoryCollectionViewCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
            
//        contentView.addSubview(image)
//        image.snp.makeConstraints { make in
//            make.left.top.right.bottom.equalTo(contentView)
//        }
        
        layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
