import UIKit

public class CustomIntensityVisualEffectView: UIVisualEffectView {

    public var blur: UIBlurEffect = UIBlurEffect(style: .light)
    public var customIntensity: CGFloat = 1

    private var animator: UIViewPropertyAnimator?

    deinit {
        animator?.stopAnimation(true)
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        effect = nil
        animator?.stopAnimation(true)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.effect = blur
        }
        animator?.fractionComplete = customIntensity
    }
}
