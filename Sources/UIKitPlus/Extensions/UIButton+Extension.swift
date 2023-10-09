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

    func setImage(_ image: UIImage?) {
        setImage(image, for: .normal)
    }
}
