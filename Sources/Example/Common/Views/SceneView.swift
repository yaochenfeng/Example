//
//  SceneView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/14.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct SceneView<Content>: Scene where Content: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some Scene {
        WindowGroup(content: content)
    }
}
