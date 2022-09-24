import Foundation

extension Array: RawRepresentable where Element: Codable {
	public init?(rawValue: String) {
		if let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode([Element].self, from: data) {
			self = result
		}
		return nil
	}

	public var rawValue: String {
		if let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) {
			return result
		}

		return "[]"
	}
}
