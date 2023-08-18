//
//  RootView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/15.
//

import SwiftUI
@available(iOS 13.0, macOS 11.0, *)
struct RootView<Content>: View where Content: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                content()
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                content()
            }
        }
    }
}
@available(iOS 13.0, macOS 11.0, *)
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView {
            Text("hello")
        }
    }
}
