import Foundation

public class Storage {

	static public var shared = Storage()

	public init() {
		createApplicationSupportDirectory()
	}

	public func url(for filename: String) -> URL? {
		applicationSupportDirectory?.appendingPathComponent(filename)
	}

	public func writeJson<T: Encodable>(_ data: T, to destination: URL) throws {
		try JSONEncoder().encode(data).write(to: destination, options: .atomicWrite)
	}

	public func writeJson<T: Encodable>(_ data: T, to filename: String) throws {
		if let url = self.url(for: filename) {
			try writeJson(data, to: url)
		}
	}

	public func readJson<T: Decodable>(from source: URL) -> T? {
		if let data = try? Data(contentsOf: source) {
			return try? JSONDecoder().decode(T.self, from: data)
		}

		return nil
	}

	public func readJson<T: Decodable>(from filename: String) -> T? {
		if let url = url(for: filename) {
			return readJson(from: url)
		}

		return nil
	}

	public var applicationSupportDirectory: URL? {
		FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first?.appendingPathComponent("de.phackh.VisualKanban")
	}

	public func createApplicationSupportDirectory() {
		if let url = applicationSupportDirectory {
			if !FileManager.default.fileExists(atPath: url.path) {
				try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
			}
		}
	}
}
