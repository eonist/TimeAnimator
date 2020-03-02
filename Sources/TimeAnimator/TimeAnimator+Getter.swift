import Foundation

extension TimeAnimator {
   /**
    * Returns the totalCount
    * - Note: This doesn't have to be super presice, as it's not dependant on being absolute
    * - Fixme: ⚠️️ Rename to maxCount?, we needed to ceil, or else some cases would be zero
    */
   internal var totalCount: Int { return Int(ceil(duration / (interval))) }
}
