import Foundation
import SwiftUI

@available(macOS 13, iOS 16, *)
extension Color {
	public init(hex: String) {
		let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		let scanner = Scanner(string: hex)

		var rgbValue: UInt64 = 0

		scanner.scanHexInt64(&rgbValue)

		let r = (rgbValue & 0xff0000) >> 16
		let g = (rgbValue & 0xff00) >> 8
		let b = rgbValue & 0xff

		self.init(
			.sRGB,
			red: Double(r) / 255,
			green: Double(g) / 255,
			blue: Double(b) / 255,
			opacity: Double(1.0)
		)
	}
}
