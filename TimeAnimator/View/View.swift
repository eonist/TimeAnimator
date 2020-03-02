import UIKit
import GeomKit

class View: UIView {
   var i: Int = 0
   let max: Int = 3
   var rect: CGRect { return UIScreen.main.bounds }
   var centerPT: CGPoint { return CGPoint(x: rect.width / 2, y: rect.height / 2) }
   lazy var centerCircle: CAShapeLayer = {
      let centerCircle: CAShapeLayer = CGShapeUtil.drawCircle(with: nil, circle: (centerPT, 40), style: (.green, nil, nil))
      self.layer.addSublayer(centerCircle)
      return centerCircle
   }()
   lazy var satelliteCircle: CAShapeLayer = {
      let satellitePT: CGPoint = centerPT.polarPoint(radius: 100, angle: 0)
      Swift.print("satellitePT:  \(satellitePT)")
      let satelliteCircle: CAShapeLayer = CGShapeUtil.drawCircle(with: nil, circle: (satellitePT, 20), style: (.purple, nil, nil))
      self.layer.addSublayer(satelliteCircle)
      return satelliteCircle
   }()
   lazy var animator: TimeAnimator = TimeAnimator(duration: 1.0, onChange: onAnimChange, onComplete: onAnimComplete)
   
   /**
    * Init
    */
   override init(frame: CGRect) {
      super.init(frame: frame)
      _ = centerCircle // Center circle
      _ = satelliteCircle // Satellite circle
      animator.start()
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Animation
 */
extension View {
   /**
    * onChange
    */
   func onAnimChange() {
      Swift.print("Animate stuff")
      let angle: CGFloat = CGFloat.pi * 2 * animator.progress
      let satellitePT: CGPoint = centerPT.polarPoint(radius: 100, angle: angle)
      CGShapeUtil.drawCircle(with: satelliteCircle, circle: (satellitePT, 20), style: (.purple, nil, nil))
   }
   /**
    * onComplete
    */
   func onAnimComplete() {
      Swift.print("Anim completed")
//      if i < max { animator.completed = onComplete }
      if i < max {
         animator.reset()
         animator.start()
         Swift.print("Reset and start again")
      } else {
         Swift.print("All done 🎉")
      }
   }
}
