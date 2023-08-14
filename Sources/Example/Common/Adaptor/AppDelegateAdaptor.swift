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
}
extension AppDelegateAdaptor: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        commomService()
        setupDebug()
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
//        RXRouter.shared.open(url)
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
//        RXRouter.shared.open(url)
        return true
    }
}
#else
class AppDelegateAdaptor: NSObject {
    var window: UIWindow?
}
#endif



extension AppDelegateAdaptor {
    func commomService() {
#if canImport(CocoaLumberjack)
        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.maximumFileSize = 1_024 * 1_024 * 20 // 20M
        fileLogger.logFileManager.maximumNumberOfLogFiles = 20 // 20 files
        DDLog.add(fileLogger)
#endif
    }
    
    func setupDebug() {
#if canImport(DoraemonKit)
        DoraemonCacheManager.sharedInstance().saveMemoryLeak(true)
        DoraemonCacheManager.sharedInstance().saveCrashSwitch(true)
        DoraemonCacheManager.sharedInstance().saveMemoryLeakAlert(true)
        DoraemonCacheManager.sharedInstance().saveLoggerSwitch(true)
        DoraemonCacheManager.sharedInstance().saveStartClass(NSStringFromClass(self.classForCoder))
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            DoraemonManager.shareInstance().install()
        })
#endif
    }
}

#if canImport(swiftUI)
import SwiftUI
extension AppDelegateAdaptor: ObservableObject {}
#endif
