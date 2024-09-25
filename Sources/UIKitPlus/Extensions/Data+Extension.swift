import UIKit

public extension Data {

    var htmlAttributedString: NSAttributedString {
        get throws {
            try NSAttributedString(
                data: self,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
        }
    }
}
