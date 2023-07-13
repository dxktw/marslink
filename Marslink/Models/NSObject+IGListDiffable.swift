import Foundation
import IGListKit

// MARK: - IGListDiffable
extension NSObject: IGListDiffable {

  public func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  public func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
    return isEqual(object)
  }
  
}
