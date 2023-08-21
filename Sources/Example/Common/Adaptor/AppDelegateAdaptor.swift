#if canImport(DoraemonKit)
import DoraemonKit

#endif
#if canImport(CocoaLumberjack)
import CocoaLumberjack
#endif

#if canImport(UIKit)
import UIKit
class AppDelegateAdaptor: UIResponder {
    var window: UIWindow?
    var logger = Logger(label: AppDelegateAdaptor.self)
}
extension AppDelegateAdaptor: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        logger.info("app 启动 options:\(String(describing: launchOptions))")
        return true
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegateAdaptor.self // 👈🏻
        return sceneConfig
    }
}
// 外部打开内容页面
extension AppDelegateAdaptor {
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
                let url = userActivity.webpageURL else { return false }
        logger.info("app userActivity:\(url) options:\(String(describing: userActivity.userInfo))")
        router.navigate(url)
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        logger.info("app open:\(url) options:\(String(describing: options))")
        router.navigate(url)
        return true
    }
}
#else
class AppDelegateAdaptor: NSObject {
    var window: UIWindow?
}
#endif

#if canImport(swiftUI)
import SwiftUI
extension AppDelegateAdaptor: ObservableObject {}
#endif
