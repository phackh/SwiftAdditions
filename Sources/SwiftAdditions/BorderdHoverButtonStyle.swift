import SwiftUI

@available(macOS 12, iOS 16, *)
public struct BorderedHoverButtonStyle: ButtonStyle {
	let hoverColor: Color = Color.black.opacity(0.1)

	@State private var isHovered = false
	
	public init(isHovered: Bool = false) {
		self.isHovered = isHovered
	}

	public func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.buttonStyle(.borderless)
			.padding(4)
			.background(RoundedRectangle(cornerRadius: 4).fill(isHovered ? hoverColor : Color.clear))
			.onHover { hover in
				self.isHovered = hover
			}
	}
}
