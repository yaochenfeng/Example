//
//  ExampleApp.swift
//  Example
//
//  Created by yaochenfeng on 2023/4/27.
//
import SwiftUI

struct AppAdaptor {
    static func main() {
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            SwiftApp.main()
        } else {
#if canImport(UIKit)
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil,
                NSStringFromClass(AppDelegateAdaptor.self))
#endif
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
private struct SwiftApp: App {
    #if os(iOS)
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegateAdaptor
    #endif
    var body: some Scene {
        WindowGroup {
            RootView {
                RoutePageView(url: URL(string: RouteProvider.rootUri))
            }
        }
    }
}
