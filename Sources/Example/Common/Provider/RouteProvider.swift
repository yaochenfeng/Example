//
//  RouteProvider.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/17.
//

import DFService
#if canImport(SwiftUI)
import SwiftUI
#endif
class RouteProvider: DFProviderType {
    static var rootUri = "home.local"
    var isBootstrap: Bool = false
    var schemes: [String] = ["example"]
    let logger = Logger(RouteProvider.self)
    required init(_ app: ApplicationContext) {
        
        if let info = Bundle.main.infoDictionary,
           let bundleURLTypes = info["CFBundleURLTypes"] as? [[String: Any]] {
            var schemes = [String]()
            for urlType in bundleURLTypes where urlType["CFBundleURLSchemes"] != nil {
                if let urlSchemes = urlType["CFBundleURLSchemes"] as? [String] {
                    schemes.append(contentsOf: urlSchemes)
                }
            }
            self.schemes = schemes
        }
        
    }
    
    func register(_ app: ApplicationContext) {
        if #available(iOS 13.0.0, *) {
            registerRouter()
        }
        router.addMiddleware(H5Middleware())
        router.addTerminateHandle { _, res in
            if case .success(let output) = res, let vc = output as? UIViewController {
                UIViewController.topViewController()?.show(vc, sender: nil)
            } else if case .success(let output) = res, let view = output as? (any View) {
                let vc = UIHostingController(rootView: AnyView(view))
                UIViewController.topViewController()?.show(vc, sender: nil)
            }
        }
    }
    
    func boot(_ app: ApplicationContext) {
        
    }
    @available(iOS 13.0.0, *)
    func registerRouter() {
        for item in RoutePage.allCases {
            router.addRouteHandler(uri: item.routeUri) { _ in
                return item.routeView
            }
        }
    }
}

#if canImport(UIKit)
import UIKit
#endif

#if canImport(SafariServices)
import SafariServices
import SwiftUI
#endif

/// 处理H5跳转

struct H5Middleware: DFMiddlewareType {
    typealias Input = RoutePipeline.Input
    typealias Output = RoutePipeline.Output
    
    func process(_ input: DFService.RoutePipeline.Input, next: @escaping NextStep) throws -> Output {
        guard let scheme = input.scheme, scheme.contains("http") else {
            return try next(input)
        }
        do {
            return try next(input)
        } catch {
#if canImport(SafariServices)
            return SFSafariViewController(url: input)
#endif
        }
    }
    
}

@available(iOS 8.0, *)
extension UIViewController {
    static func topViewController() -> UIViewController? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }.first?.rootViewController?.topMostViewController()
        } else {
            return UIApplication.shared.delegate?.window??.rootViewController
        }
        
    }
    func topMostViewController() -> UIViewController {
        if let presentedVC = presentedViewController {
            return presentedVC.topMostViewController()
        }
        if let navController = self as? UINavigationController {
            return navController.visibleViewController?.topMostViewController() ?? navController
        }
        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topMostViewController() ?? tabBarController
        }
        if let nav = self.navigationController {
            return nav.topMostViewController()
        }
        return self
    }
}
