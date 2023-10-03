import UIKit

public extension UIView {

    class func animate(
        withDuration duration: TimeInterval,
        options: UIView.AnimationOptions = [],
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: options,
            animations: animations,
            completion: completion
        )
    }

    var isVisible: Bool {
        get {
            !isHidden
        }
        set {
            isHidden = !newValue
        }
    }

    func setHidden(
        _ hidden: Bool,
        withDuration duration: Double = 0.3,
        delay: TimeInterval = 0,
        completion: ((Bool) -> Void)? = nil
    ) {
        guard hidden != isHidden else {
            completion?(true)
            return
        }

        if !hidden {
            isHidden = false
        }

        // swiftlint:disable:next multiline_arguments
        UIView.animate(withDuration: duration, delay: delay) {
            self.alpha = hidden ? 0 : 1
        } completion: { completed in
            if hidden {
                self.isHidden = true
            }
            completion?(completed)
        }
    }

    enum FlipOtions {
        case `default`
        case custom(AnimationOptions)
    }

    func flip(
        toHidden hidden: Bool,
        duration: Double = 0.5,
        options: FlipOtions = .default,
        completion: ((Bool) -> Void)? = nil
    ) {
        guard hidden != isHidden else {
            completion?(true)
            return
        }

        let animationOptions: AnimationOptions = {
            if case let .custom(animationOptions) = options {
                return animationOptions
            }
            return [.curveEaseOut, hidden ? .transitionFlipFromTop : .transitionFlipFromBottom]
        }()

        UIView.transition(
            with: self,
            duration: duration,
            options: animationOptions
        ) {
            if !hidden {
                self.isHidden = hidden
            } else {
                self.layer.opacity = 0
            }
        } completion: { completed in
            if hidden {
                self.isHidden = hidden
                self.layer.opacity = 1
            }
            completion?(completed)
        }
    }

    func firstSuperview(where condition: (UIView) -> Bool) -> UIView? {
        guard var view = superview else { return nil }
        while !condition(view) {
            guard let superview = view.superview else { return nil }
            view = superview
        }
        return view
    }

    func screenshot(maskView: UIView) -> UIImage {
        screenshot(maskFrame: maskView.frame)
    }

    func screenshot(maskFrame: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(maskFrame.size)

        if let context = UIGraphicsGetCurrentContext() {
            context.translateBy(
                x: frame.minX - maskFrame.minX,
                y: frame.minY - maskFrame.minY
            )
            layer.render(in: context)
        }

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image ?? .init()
    }
}
