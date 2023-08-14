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
        setupCommon()
        if #available(iOS 14.0, *) {
            MainApp.main()
        } else {
            #if os(iOS)
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil,
                NSStringFromClass(AppDelegateAdaptor.self))
            #endif
        }
    }
    /// 公共配置
    
    static func setupCommon() {
        if #available(iOS 11, *) {
            return
        }
    }
    
}

extension AppAdaptor {
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    struct MainApp: App {
        @UIApplicationDelegateAdaptor var appDelegate: AppDelegateAdaptor
        var body: some Scene {
            SceneView {
                Text("Hello world")
            }
        }
    }
}
