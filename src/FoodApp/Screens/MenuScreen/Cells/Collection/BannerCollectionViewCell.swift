
import UIKit

final class BannerCollectionViewCell : UICollectionViewCell {
    static let identifier = "BannerCollectionViewCell"
    
    private lazy var image: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner1")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(contentView)
        }
        
        layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
