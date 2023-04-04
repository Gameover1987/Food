
import UIKit

final class BannerCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "BannerCollectionViewCell"
    
    static let size = CGSize(width: 300.0, height: 112)
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner1")
        imageView.contentMode = .center
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.left.top.equalTo(contentView)
            make.width.equalTo(300)
            make.height.equalTo(112)
        }
        
        layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
