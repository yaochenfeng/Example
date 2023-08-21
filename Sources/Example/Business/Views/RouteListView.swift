//
//  RouteListView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/19.
//

import SwiftUI

struct RouteListView: View {
    let logger = Logger(label: "RouteListView")
    @State private var selectedItem: RoutePage = .root
    var body: some View {
        List {
            ForEach(RoutePage.allCases) { routePage in
                RouteLinkView(routePage.routeURL) {
                    Text(routePage.title)
                }
            }
        }.setNavigate(Text("路由列表"))
    }
}

struct RouteListView_Previews: PreviewProvider {
    static var previews: some View {
        RootView {
            RouteListView()
        }
        
    }
}
