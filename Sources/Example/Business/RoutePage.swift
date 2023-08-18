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
}

extension RoutePage {
    var routeUri: String {
        switch self {
        case .root: return RouteProvider.rootUri
        default: return RouteProvider.rootUri + "/" + rawValue
        }
    }
}
//#if canImport(swiftUI)
import SwiftUI

extension RoutePage {
    @available(iOS 13.0.0, *)
    var routeView: some View {
        switch self {
        case .root:
            return Text("root")
        case .setting:
            return Text("setting")
        }
    }
}
//#endif
