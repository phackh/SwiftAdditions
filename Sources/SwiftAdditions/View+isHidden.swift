import SwiftUI

@available(macOS 12, iOS 16, *)
extension View {
	@ViewBuilder public func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
		if hidden {
			if !remove { self.hidden() }
		}
		else {
			self
		}
	}
}
