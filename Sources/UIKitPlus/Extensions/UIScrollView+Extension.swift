import UIKit

public extension UIScrollView {

    /**
     Bounces the scroll view in the specified direction.

     - Parameter axis: The direction of the bounce animation, either horizontal or vertical.
     - Parameter offset: The offset for the bounce animation. Default is 30.0.
     - Parameter duration: The duration of the bounce animation. Default is 0.5 seconds.
     - Parameter delay: The delay before starting the bounce animation. Default is zero seconds.

     - SeeAlso: `UIScrollView.BounceAxis`
     */
    func bounce(
        by axis: NSLayoutConstraint.Axis,
        with offset: CGFloat = 30.0,
        and duration: Double = 0.5,
        after delay: Double = .zero
    ) {
        let originalContentOffset = contentOffset
        let newContentOffset = switch axis {
        case .horizontal:
            CGPoint(x: offset, y: 0)
        case .vertical:
            CGPoint(x: 0, y: offset)
        @unknown default:
            CGPoint.zero
        }

        UIView.animateSteps { sequence in
            sequence.add(duration: duration) {
                self.contentOffset = newContentOffset
            }
            .add(duration: duration) {
                self.contentOffset = originalContentOffset
            }
        }
    }
}
