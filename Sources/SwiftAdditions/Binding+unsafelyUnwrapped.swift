import SwiftUI

@available(macOS 12, iOS 16, *)
extension Binding {
	public func unsafelyUnwrapped<T>() -> Binding<T> where Value == T? {
		.init {
			self.wrappedValue!
		} set: { newValue in
			self.wrappedValue = newValue
		}
	}
}
