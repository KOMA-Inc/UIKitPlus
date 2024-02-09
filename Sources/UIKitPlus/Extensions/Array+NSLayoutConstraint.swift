import UIKit

public extension Array where Element == NSLayoutConstraint {

    func activate() {
        forEach { $0.isActive = true }
    }

    func deactivate() {
        forEach { $0.isActive = false }
    }

    func setActive(_ isActive: Bool) {
        forEach { $0.isActive = isActive }
    }

    func setConstant(_ constant: CGFloat) {
        forEach { $0.constant = constant }
    }
}
