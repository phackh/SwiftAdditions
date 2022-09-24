import SwiftUI

@available(macOS 12, iOS 16, *)
public struct HoverPointer: ViewModifier {
	@State private var isHovered = false

	public func body(content: Content) -> some View {
		content
			.onHover { hover in
				self.isHovered = hover

				DispatchQueue.main.async {
					if hover {
						NSCursor.pointingHand.push()
					}
					else {
						NSCursor.pop()
					}
				}
			}
	}
}

@available(macOS 12, iOS 16, *)
extension View {
	public func hoverPointer() -> some View {
		self.modifier(HoverPointer())
	}
}
