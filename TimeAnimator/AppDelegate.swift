import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = createWindow()
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      _ = window
      return true
   }
}
extension AppDelegate {
   func createWindow() -> UIWindow {
      let win = UIWindow(frame: UIScreen.main.bounds)
      let vc = ViewController()
      win.rootViewController = vc
      win.makeKeyAndVisible() // Important since we have no Main storyboard anymore
      return win
   }
}
class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = View()
      view.backgroundColor = .orange
   }
   override var prefersStatusBarHidden: Bool { return false }
}
class View: UIView {
   override init(frame: CGRect) {
      super.init(frame: frame)
      TimeAnimator(duration: 0.3, onChange: { Swift.print("Animate stuff") }, onComplete: { Swift.print("Anim completed") }).start()
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
