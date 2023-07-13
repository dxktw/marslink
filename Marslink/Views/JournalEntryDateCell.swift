import UIKit

class JournalEntryDateCell: UICollectionViewCell {
  
  let label: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.font = AppFont(size: 14)
    label.textColor = UIColor(hex6: 0x42c84b)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    contentView.addSubview(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let padding = CommonInsets
    label.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, padding.left, 0, padding.right))
  }
  
}
