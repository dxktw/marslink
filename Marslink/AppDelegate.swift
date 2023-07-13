import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = UIColor.black
    let nav = UINavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
    nav.pushViewController(FeedViewController(), animated: false)
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    return true
  }
  
}

