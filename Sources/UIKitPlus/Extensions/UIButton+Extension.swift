import UIKit

public extension UIButton {

    var title: String? {
        get {
            title(for: .normal)
        }
        set {
            setTitle(newValue)
        }
    }

    func setTitle(_ title: String?) {
        setTitle(title, for: .normal)
    }
}
