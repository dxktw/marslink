import Foundation

class User: NSObject {
  
  let id: Int
  let name: String
  
  init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
  
}
