import UIKit

public extension Data {

    var htmlAttributedString: NSAttributedString {
        get throws {
            if #available(iOS 18.0, *) {
                try NSAttributedString(
                    data: self,
                    options: [
                        .documentType: NSAttributedString.DocumentType.html,
                        .characterEncoding: String.Encoding.utf8.rawValue,
                        .textKit1ListMarkerFormatDocumentOption: true
                    ],
                    documentAttributes: nil
                )
            } else {
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
}
