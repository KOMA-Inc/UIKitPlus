import UIKit

extension UIEdgeInsets {

    static func make(
        top: CGFloat = .zero,
        bottom: CGFloat = .zero,
        leading: CGFloat = .zero,
        trailing: CGFloat = .zero
    ) -> UIEdgeInsets {
        .init(
            top: top,
            left: leading,
            bottom: bottom,
            right: trailing
        )
    }

    static func make(vertical: CGFloat, horizontal: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.make(
            top: vertical,
            bottom: vertical,
            leading: horizontal,
            trailing: horizontal
        )
    }

    static func make(_ padding: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.make(vertical: padding, horizontal: padding)
    }
}
