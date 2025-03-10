import UIKit

/// A `UIView` subclass that allows touch events to pass through to views behind it.
///
/// `PassthroughView` overrides `hitTest(_:with:)` to return `nil` when the view itself
/// is hit, ensuring that touch events reach underlying views.
///
/// - Important: This view should be used when you want to allow interactions with
/// views behind it while still being part of the view hierarchy.
open class PassthroughView: UIView {
    /// Determines the view that should receive the touch event.
    ///
    /// - Parameters:
    ///   - point: The touch location in the receiver’s coordinate system.
    ///   - event: The event that triggered the hit test.
    /// - Returns: The view that should receive the event, or `nil` if the touch should pass through.
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}
