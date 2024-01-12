import UIKit

public extension UIStackView {

    func view(by index: Int) -> UIView? {
        if arrangedSubviews.indices.contains(index) {
            arrangedSubviews[index]
        } else {
            nil
        }
    }

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

    func addArrangedSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            addArrangedSubview(subview)
        }
    }

    func animateSubviewsAppearance(
        startingFrom index: Int,
        customAnimation: ((_ target: UIView, _ completion: @escaping (Bool) -> Void) -> Void)? = nil,
        completion: (() -> Void)? = nil
    ) {
        guard let subview = view(by: index) else {
            completion?()
            return
        }

        customAnimation?(subview) { _ in
            self.animateSubviewsAppearance(
                startingFrom: index + 1,
                customAnimation: customAnimation,
                completion: completion
            )
        }
    }

    func addArrangedSubviews(
        _ subviews: [UIView],
        startingFrom: Int = 0,
        completion: (() -> Void)? = nil,
        customAnimation: ((_ target: UIView, _ completion: @escaping (Bool) -> Void) -> Void)? = nil
    ) {
        addArrangedSubviews(subviews)
        animateSubviewsAppearance(
            startingFrom: startingFrom,
            customAnimation: customAnimation,
            completion: completion
        )
    }

    func addArrangedSubviewsWithAnimation(
        _ subviews: [UIView],
        preAnimationHandler: AnimationHandler = .defaultPreAnimationHandler,
        animationHandler: AnimationHandler = .defaultAnimationHandler,
        completion: (() -> Void)? = nil
    ) {
        let dispatchGroup = DispatchGroup()

        // Perform pre animation block for all subviews
        subviews.forEach {
            dispatchGroup.enter()
            preAnimationHandler.animate(view: $0) { _ in
                dispatchGroup.leave()
            }
        }

        func animate(
            _ subviews: [UIView],
            animationHandler: AnimationHandler,
            completion: (() -> Void)?
        ) {
            guard let first = subviews.first else {
                completion?()
                return
            }

            animationHandler.animate(view: first) { _ in
                animate(
                    Array(subviews.dropFirst()),
                    animationHandler: animationHandler,
                    completion: completion
                )
            }
        }

        // When completed, add arranged subviews
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.addArrangedSubviews(subviews)
            animate(subviews, animationHandler: animationHandler, completion: completion)
        }
    }
}
