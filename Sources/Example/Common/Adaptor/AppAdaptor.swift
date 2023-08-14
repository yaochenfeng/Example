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
        if #available(iOS 14.0, *) {
            MainApp.main()
        } else {
            #if os(iOS)
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil,
                NSStringFromClass(AppDelegateAdaptor.self))
            #endif
        }
    }
}

@available(iOS 14.0, *)
struct MainApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegateAdaptor
    var body: some Scene {
        WindowGroup {
           Text("")
        }
    }
}
