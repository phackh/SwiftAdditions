//
//  SwiftUIView.swift
//  
//
//  Created by Patrick Hackh on 02.11.22.
//

import SwiftUI

public enum FlexibleNavigationSplitViewColumns {
	case two
	case three
}

@available(macOS 13, iOS 16, *)
public struct FlexibleNavigationSplitView<SidebarView: View, ContentView: View, DetailView: View>: View {
	let columns: FlexibleNavigationSplitViewColumns
	@Binding var visibility: NavigationSplitViewVisibility
	
	@ViewBuilder var sidebar: () -> SidebarView
	@ViewBuilder var content: () -> ContentView
	@ViewBuilder var detail: () -> DetailView
	
	public init(columns: FlexibleNavigationSplitViewColumns, visibility: Binding<NavigationSplitViewVisibility>, sidebar: @escaping () -> SidebarView, content: @escaping () -> ContentView, detail: @escaping () -> DetailView) {
		self.columns = columns
		_visibility = visibility
		self.sidebar = sidebar
		self.content = content
		self.detail = detail
	}
	
	public var body: some View {
		switch (columns) {
		case .two:
			NavigationSplitView(columnVisibility: $visibility, sidebar: sidebar, detail: detail)
		case .three:
			NavigationSplitView(columnVisibility: $visibility, sidebar: sidebar, content: content, detail: detail)
		}
	}
}
