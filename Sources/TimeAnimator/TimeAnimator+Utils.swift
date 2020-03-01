import CoreGraphics
import QuartzCore
/**
 * Utils
 */
extension TimeAnimator {
   /**
    * Returns (0 to 1)
    */
   public var progress: CGFloat {
      return CGFloat(curCount) / CGFloat(totalCount)
   }
   /**
    * Util method for interpolating between values
    */
   public static func interpolate(from: CGFloat, to: CGFloat, fraction: CGFloat) -> CGFloat {
      return fraction * (to - from) + from
   }
}
