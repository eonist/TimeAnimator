import UIKit
import GeomKit
/**
 * Animates a circle around a center
 */
class View: UIView {
   var i: Int = 0 // num of times it has rotated
   let max: Int = 10 // repeat count
   lazy var centerCircle: CAShapeLayer = createCenterCirle()
   lazy var satelliteCircle: CAShapeLayer = createSatelliteCircle()
   lazy var animator: TimeAnimator = TimeAnimator(duration: 3.0, onChange: onAnimChange, onComplete: onAnimComplete)
   /**
    * Init
    */
   override init(frame: CGRect) {
      super.init(frame: frame)
      _ = centerCircle // create Center circle
      _ = satelliteCircle // create Satellite circle
      self.animator.start()
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
      Swift.print("onAnimChange")
      let angle: CGFloat = CGFloat.pi * 2 * animator.progress
      let satellitePT: CGPoint = centerPT.polarPoint(radius: 100, angle: angle)
      CGShapeUtil.drawCircle(with: satelliteCircle, circle: (satellitePT, 20), style: (.gray, nil, nil))
   }
   /**
    * onComplete
    */
   func onAnimComplete() {
      Swift.print("onAnimComplete")
//      if i < max { animator.completed = onComplete }
      if i < max {
         i += 1 // increment the count
         self.animator.reset()
         self.animator.tick = self.onAnimChange
         self.animator.onComplete = self.onAnimComplete
         self.animator.start()
         Swift.print("Reset and start again")
      } else {
         Swift.print("All done 🎉")
      }
   }
}
/**
 * Getter
 */
extension View {
   var rect: CGRect { return UIScreen.main.bounds }
   var centerPT: CGPoint { return CGPoint(x: rect.width / 2, y: rect.height / 2) }
}
/**
 * Create
 */
extension View {
   /**
    * createCenterCirle
    */
   func createCenterCirle() -> CAShapeLayer {
      let centerCircle: CAShapeLayer = CGShapeUtil.drawCircle(with: nil, circle: (centerPT, 20), style: (.black, nil, nil))
      self.layer.addSublayer(centerCircle)
      return centerCircle
   }
   /**
    * createSatelliteCircle
    */
   func createSatelliteCircle() -> CAShapeLayer {
      let satellitePT: CGPoint = centerPT.polarPoint(radius: 100, angle: 0)
      Swift.print("satellitePT:  \(satellitePT)")
      let satelliteCircle: CAShapeLayer = CGShapeUtil.drawCircle(with: nil, circle: (satellitePT, 20), style: (.gray, nil, nil))
      self.layer.addSublayer(satelliteCircle)
      return satelliteCircle
   }
}
