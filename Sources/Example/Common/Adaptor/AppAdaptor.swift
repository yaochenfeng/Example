//
//  ExampleApp.swift
//  Example
//
//  Created by yaochenfeng on 2023/4/27.
//
import SwiftUI
@main
struct AppAdaptor {
    static func main() {
        DF.addProvider(CommomProvider.self)
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            MainApp.main()
        } else {
            #if os(iOS)
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil,
                NSStringFromClass(AppDelegateAdaptor.self))
            #endif
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
private struct MainApp: App {
    #if os(iOS)
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegateAdaptor
    #endif
    var body: some Scene {
        WindowGroup {
            RootView {
                HomeView()
            }
        }.commands {
            MenuView()
        }
    }
}
