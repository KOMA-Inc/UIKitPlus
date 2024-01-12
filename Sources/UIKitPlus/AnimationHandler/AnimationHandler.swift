import UIKit

public protocol AnimationHandler {

    func animate(view: UIView, completion: ((Bool) -> Void)?)
}

public extension AnimationHandler where Self == OpacityAnimationHandler {

    static var defaultAnimationHandler: Self {
        OpacityAnimationHandler(duration: 0.5, delay: 0)
    }
}

public extension AnimationHandler where Self == OpacityPreAnimationHandler {

    static var defaultPreAnimationHandler: Self {
        OpacityPreAnimationHandler(duration: 0, delay: 0)
    }
}
