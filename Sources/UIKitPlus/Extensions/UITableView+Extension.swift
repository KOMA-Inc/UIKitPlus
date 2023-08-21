import UIKit

public extension UITableView {
    func register(type: UITableViewCell.Type) {
        register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func register(_ types: UITableViewCell.Type...) {
        types.forEach { type in
            register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
        }
    }

    func dequeue<Cell: UITableViewCell>(type: Cell.Type, for indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? Cell
    }
}
