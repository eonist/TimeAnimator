import Foundation
/**
 * Core
 */
extension TimeAnimator {
   /**
    * Called on every "tick"
    */
   override public func update() {
      if curCount >= totalCount {
         curCount = totalCount
         super.update()
         onComplete()
         stop()
      }else {
         super.update()
         curCount += 1
      }
   }
   /**
    * Stops timer and then sets curCount to 0
    */
   override public func reset() {
      stop()
      curCount = 0
   }
}
