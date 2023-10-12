import QuartzCore

public extension CALayer {
    func addSublayers(_ sublayers: [CALayer]) {
        sublayers.forEach { addSublayer($0) }
    }
}
