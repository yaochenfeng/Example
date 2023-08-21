//
//  RouteLinkView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/21.
//

import SwiftUI

struct RouteLinkView<Label>: View where Label: View {
    let url: URL?
    let content: () -> Label
    public init(_ url: URL?, @ViewBuilder label: @escaping () -> Label) {
        self.url = url
        self.content = label
    }
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationLink(value: url, label: content)
        } else {
            NavigationLink(destination: RoutePageView(url: url), label: content)
        }
    }
}
