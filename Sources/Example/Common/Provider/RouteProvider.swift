//
//  RouteProvider.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/17.
//

import UIKit
import DFService

class RouteProvider: DFProviderType {
    var isBootstrap: Bool = false
    
    required init(_ app: ApplicationContext) {
        
    }
    
    func register(_ app: ApplicationContext) {
        router.addMiddleware(H5Middleware())
        router.addTerminateHandle { _, res in
            if case .success(let output) = res, let vc = output as? UIViewController {
                UIViewController.topViewController()?.show(vc, sender: nil)
            }
        }
    }
    
    func boot(_ app: ApplicationContext) {
        
    }
}
#if canImport(SafariServices)
import SafariServices
#endif
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

#if canImport(UIKit)
import UIKit
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
        return self
    }
}
#endif
