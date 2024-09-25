public extension String {

    var htmlAttributedString: NSAttributedString {
        get throws {
            guard let data = self.data(using: .utf8) else {
                throw NSError(domain: "", code: -1)
            }
            return try data.htmlAttributedString
        }
    }
}
