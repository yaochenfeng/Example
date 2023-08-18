//
//  LogProvider.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/18.
//

import Foundation
import DFService
import Logging

typealias Logger = Logging.Logger
/// 日志服务
class LoggerProvider: DFProviderType {
    var isBootstrap: Bool = false
    
    required init(_ app: ApplicationContext) {
#if canImport(CocoaLumberjack)
        setupCocoaLumberjack()
#endif
    }
    
    func register(_ app: ApplicationContext) {

    }
    
    func boot(_ app: ApplicationContext) {}
    
}
#if canImport(CocoaLumberjack)
import CocoaLumberjack
extension LoggerProvider {
    func setupCocoaLumberjack() {
        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        LoggingSystem.bootstrap { label in
            let logger = DDLogHandler(label: label)
            return logger
        }
    }
}
struct DDLogHandler: LogHandler {
    var label: String
    subscript(metadataKey _: String) -> Logging.Logger.Metadata.Value? {
        get {
            return nil
        }
        set(newValue) {
            
        }
    }
    
    var metadata: Logging.Logger.Metadata = .init()
    
    var logLevel: Logging.Logger.Level = .info
    
    func log(level: Logger.Level,
             message: Logger.Message,
             metadata: Logger.Metadata?,
             source: String,
             file: String,
             function: String,
             line: UInt) {
        let message = DDLogMessage(message: message.description,
                                   level: level.ddLogLevel,
                                   flag: .verbose,
                                   context: 0,
                                   file: file,
                                   function: function,
                                   line: line,
                                   tag: nil,
                                   timestamp: nil)
        DDLog.log(asynchronous: true, message: message)
    
    }
}

extension Logger.Level {
    var ddLogLevel: DDLogLevel {
        switch self {
        case .trace:
            return .verbose
        case .debug:
            return .debug
        case .info:
            return .info
        case .notice:
            return .info
        case .warning:
            return .warning
        case .error:
            return .error
        case .critical:
            return .error
        }
    }
}
#endif
