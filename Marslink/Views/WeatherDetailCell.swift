import UIKit

class WeatherDetailCell: UICollectionViewCell {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.font = AppFont()
    label.textColor = UIColor(hex6: 0x42c84b)
    return label
  }()
  
  let detailLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.font = AppFont()
    label.textColor = UIColor(hex6: 0x42c84b)
    label.textAlignment = .right
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(titleLabel)
    contentView.addSubview(detailLabel)
    contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let insetBounds = UIEdgeInsetsInsetRect(bounds, CommonInsets)
    titleLabel.frame = insetBounds
    detailLabel.frame = insetBounds
  }
  
}
