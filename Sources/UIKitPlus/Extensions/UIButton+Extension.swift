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

    func setTitleColor(_ color: UIColor?) {
        setTitleColor(color, for: .normal)
    }

    func setTitle(_ title: String?) {
        setTitle(title, for: .normal)
    }

    func setImage(_ image: UIImage?) {
        setImage(image, for: .normal)
    }

    var imageEdgeInsetsIgnoreDeprecated: UIEdgeInsets {
        get {
            value(forKey: "imageEdgeInsets") as! UIEdgeInsets
        }
        set {
            setValue(newValue, forKey: "imageEdgeInsets")
        }
    }

    var contentEdgeInsetsDeprecated: UIEdgeInsets {
        get {
            value(forKey: "contentEdgeInsets") as! UIEdgeInsets
        }
        set {
            setValue(newValue, forKey: "contentEdgeInsets")
        }
    }

    @available(iOS 14.0, *)
    func addAction(
        withIdentifier identifier: String? = nil,
        for event: UIControl.Event = .touchUpInside,
        _ action: @escaping () -> Void
    ) {
        let identifier: UIAction.Identifier? = identifier.map {
            UIAction.Identifier.init($0)
        }
        addAction(UIAction(identifier: identifier) { _ in action() }, for: event)
    }

    @available(iOS 14.0, *)
    func removeAction(
        withIdentifier identifier: String,
        for event: UIControl.Event = .touchUpInside
    ) {
        let identifier = UIAction.Identifier(identifier)
        removeAction(identifiedBy: identifier, for: event)
    }
}
