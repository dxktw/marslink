import Foundation

class JournalEntry: NSObject, DateSortable {
  
  let date: Date
  let text: String
  let user: User
  
  init(date: Date, text: String, user: User) {
    self.date = date
    self.text = text
    self.user = user
  }
  
}
