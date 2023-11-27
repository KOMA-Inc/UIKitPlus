import UIKit

@resultBuilder
public struct ConstraintBuilder {
    public static func buildBlock(
        _ components: NSLayoutConstraint...
    ) -> [NSLayoutConstraint] {
        components
    }
}

public extension UIView {
    func activate(
        @ConstraintBuilder constraints: () -> [NSLayoutConstraint]
    ) {
        NSLayoutConstraint.activate(constraints())
    }
}
