#if canImport(AppKit)
import AppKit
#endif

import Foundation
import SwiftUI

public struct CodableColor: Hashable, Equatable, Codable {
	public var red: CGFloat = 0.0
	public var green: CGFloat = 0.0
	public var blue: CGFloat = 0.0
	public var alpha: CGFloat = 1.0

	public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
		self.red = red
		self.green = green
		self.blue = blue
		self.alpha = alpha
	}

#if os(macOS)
	public init(nsColor: NSColor) {
		if let rgbColor = nsColor.usingColorSpace(.sRGB) {
			red = rgbColor.redComponent
			green = rgbColor.greenComponent
			blue = rgbColor.blueComponent
			alpha = rgbColor.alphaComponent
		}
	}

	@available(macOS 13, *)
	public var nsColor: NSColor {
		NSColor(red: red, green: green, blue: blue, alpha: alpha)
	}
#endif
}

extension CodableColor {
	static public var favorites: [CodableColor] {
		[
			CodableColor(red: 0 / 255, green: 204 / 255, blue: 255 / 255),
			CodableColor(red: 201 / 255, green: 0 / 255, blue: 0 / 255),
			CodableColor(red: 230 / 255, green: 73 / 255, blue: 128 / 255),
			CodableColor(red: 190 / 255, green: 75 / 255, blue: 219 / 255),
			CodableColor(red: 121 / 255, green: 80 / 255, blue: 242 / 255),
			CodableColor(red: 76 / 255, green: 110 / 255, blue: 245 / 255),
			CodableColor(red: 34 / 255, green: 139 / 255, blue: 230 / 255),
			CodableColor(red: 21 / 255, green: 170 / 255, blue: 191 / 255),
			CodableColor(red: 18 / 255, green: 184 / 255, blue: 134 / 255),
			CodableColor(red: 64 / 255, green: 192 / 255, blue: 87 / 255),
			CodableColor(red: 130 / 255, green: 201 / 255, blue: 30 / 255),
			CodableColor(red: 250 / 255, green: 176 / 255, blue: 5 / 255),
			CodableColor(red: 253 / 255, green: 126 / 255, blue: 20 / 255),
		]
	}
}

#if os(macOS)
extension Color {
	public init(_ codableColor: CodableColor) {
		self.init(nsColor: codableColor.nsColor)
	}
}
#endif
