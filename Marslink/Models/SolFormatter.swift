import Foundation

struct SolFormatter {
  
  let landingDate: Date
  
  init(landingDate: Date = Date(timeIntervalSinceNow: -31725960)) {
    self.landingDate = landingDate
  }
  
  func sols(fromDate date: Date) -> Int {
    let martianDay: TimeInterval = 1477 * 60 // 24h37m
    let seconds = date.timeIntervalSince(landingDate)
    return lround(seconds / martianDay)
  }
  
}
