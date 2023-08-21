import UIKit

public extension UIStackView {

    func removeLastArrangedSubview() {
        guard let subview = arrangedSubviews.last else { return }
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }

    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }

    func removeAllArrangedSubviews(where contition: (UIView) -> Bool) {
        arrangedSubviews.forEach {
            if contition($0) {
                removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
        }
    }
}
