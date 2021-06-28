import Foundation
import SimpleTimer
/**
 * TimeAnimator is a simple animation framework that uses a timer to animate
 * - Note: If you want to use TimeAnimator in a locally scoped variable, you should use lazy var if you want to hock up onChange and onComplete inline
 * ## Examples:
 * let to = self.curX + 1
 * let animator = TimeAnimator(duration: 0.3)
 * animator.tick = {
 *    Swift.print("animator.curCount:  \(animator.curCount)")
 *    Swift.print("animator.progress:  \(animator.progress)")
 *    self.curX = TimeAnimator.Interpolate(from: from, to: to, fraction: animator.progress)
 *    self.frame.origin.x self.curX
 * }
 * animator.start()
 * // One-liner:
 * TimeAnimator(duration: 0.3, onChange: { /* Animate stuff */ }, onComplete: { /*Anim completed*/ }).start()
 * - Fixme: ⚠️️ Rather import SimpleTimer than include the .swift file
 */
public class TimeAnimator: SimpleTimer {
   internal var curCount: Int = 0
   public var duration: TimeInterval // In seconds
   public var onComplete: OnComplete
   /**
    * - Fixme: ⚠️️ Add doc
    */
   public init(duration: TimeInterval, onChange:@escaping OnChange = defaultOnComplete, onComplete:@escaping OnComplete = defaultOnComplete) {
      self.duration = duration
      self.onComplete = onComplete
      super.init(interval: TimeAnimator.fps, repeats: true, onTick: onChange)
   }
}
