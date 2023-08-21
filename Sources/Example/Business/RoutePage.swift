//
//  RoutePage.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/18.
//

import Foundation

enum RoutePage: String, CaseIterable {
    case root
    case setting
    case aboutMe
}
extension RoutePage: Identifiable {
    var id: String {
        return rawValue
    }
    var title: String {
        switch self {
        case .root:
            return "首页"
        case .setting:
            return "设置"
        case .aboutMe:
            return "关于"
        }
    }
}

extension RoutePage {
    var routeUri: String {
        switch self {
        case .root: return RouteProvider.rootUri
        default: return RouteProvider.rootUri + "/" + rawValue
        }
    }
    var routeURL: URL? {
        return URL(string: routeUri)
    }
    func navigate() {
        guard let url = URL(string: routeUri) else { return }
        router.navigate(url)
    }
}
import SwiftUI

extension RoutePage {
    
    var routeView: some View {
        let page: any View
        switch self {
        case .root:
            page = RouteListView()
        case .setting:
            page = Text("setting")
        case .aboutMe:
            page = AboutMeView()
        }
        return AnyView(page)
    }
}
