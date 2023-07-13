import UIKit

class MessageCell: UICollectionViewCell {
  
  static let titleHeight: CGFloat = 30
  static let font = AppFont()

  static func cellSize(width: CGFloat, text: String) -> CGSize {
    let labelBounds = TextSize.size(text, font: MessageCell.font, width: width, insets: CommonInsets)
    return CGSize(width: width, height: labelBounds.height + MessageCell.titleHeight)
  }
  
  let messageLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.numberOfLines = 0
    label.font = MessageCell.font
    label.textColor = UIColor.white
    return label
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.font = AppFont(size: 14)
    label.textColor = UIColor(hex6: 0x42c84b)
    return label
  }()
  
  let statusLabel: UILabel = {
    let label = UILabel()
    label.layer.borderColor = UIColor(hex6: 0x76879d).cgColor
    label.layer.borderWidth = 1
    label.backgroundColor = UIColor.clear
    label.font = AppFont(size: 8)
    label.textColor = UIColor(hex6: 0x76879d)
    label.textAlignment = .center
    label.text = "NEW MESSAGE"
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    contentView.addSubview(messageLabel)
    contentView.addSubview(titleLabel)
    contentView.addSubview(statusLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame = CGRect(x: CommonInsets.left, y: 0, width: bounds.width - CommonInsets.left - CommonInsets.right, height: MessageCell.titleHeight)
    statusLabel.frame = CGRect(x: bounds.width - 80, y: 4, width: 70, height: 18)
    let messageFrame = CGRect(x: 0, y: titleLabel.frame.maxY, width: bounds.width, height: bounds.height - MessageCell.titleHeight)
    messageLabel.frame = UIEdgeInsetsInsetRect(messageFrame, CommonInsets)
  }
}
