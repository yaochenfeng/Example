//
//  DebugProvider.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/18.
//

import Foundation
import DFService
/// 测试服务
class DebugProvider: DFProviderType {
    var isBootstrap: Bool = false
    
    required init(_ app: ApplicationContext) {
        
    }
    
    func register(_ app: ApplicationContext) {
#if canImport(DoraemonKit)
        setupDoraemonKit()
#endif
    }
    
    func boot(_ app: ApplicationContext) {}
    
}
#if canImport(DoraemonKit)
import DoraemonKit
extension DebugProvider {
    func setupDoraemonKit() {
        DoraemonCacheManager.sharedInstance().saveMemoryLeak(true)
        DoraemonCacheManager.sharedInstance().saveCrashSwitch(true)
        DoraemonCacheManager.sharedInstance().saveMemoryLeakAlert(true)
        DoraemonCacheManager.sharedInstance().saveLoggerSwitch(true)
        DoraemonCacheManager.sharedInstance().saveStartClass(NSStringFromClass(AppDelegateAdaptor.classForCoder()))
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            DoraemonManager.shareInstance().install()
        })
        DoraemonManager.shareInstance().h5DoorBlock = { str in
            guard let url = URL(string: str) else { return }
            router.navigate(url)
        }
    }
}
#endif
