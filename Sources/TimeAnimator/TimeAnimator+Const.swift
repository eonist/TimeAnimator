import Foundation

extension TimeAnimator {
   static let fps: TimeInterval = 1 / 30 // 1 / 30 is 30-FPS 1 / 60 IS 60-FPS
   public static let defaultOnChange: OnChange = { Swift.print("TimerAnimator.onChange") }
   public static let defaultOnComplete: OnComplete = { Swift.print("TimerAnimator.onComplete") }
}
