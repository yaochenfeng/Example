//
//  CommonProvider.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/17.
//

class AppProvider: DFProviderType {
    var isBootstrap: Bool = false
    
    required init(_ app: ApplicationContext) {
#if canImport(CocoaLumberjack)
        setupCocoaLumberjack()
#endif
        for provider in providers {
            app.addProvider(provider)
        }
    }
    
    func register(_ app: ApplicationContext) {}
    
    func boot(_ app: ApplicationContext) {}
    
    var providers: [DFProviderType.Type] = [
        DebugProvider.self,
        RouteProvider.self,
    ]
}
#if canImport(CocoaLumberjack)
import CocoaLumberjack
extension AppProvider {
    func setupCocoaLumberjack() {
        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.maximumFileSize = 1_024 * 1_024 * 20 // 20M
        fileLogger.logFileManager.maximumNumberOfLogFiles = 20 // 20 files
        DDLog.add(fileLogger)
    }
}
#endif
