// swift-tools-version: 5.7
import Foundation

extension UUID: RawRepresentable {
	public init?(rawValue: String) {
		self.init(uuidString: rawValue)
	}

	public var rawValue: String {
		uuidString
	}
}
