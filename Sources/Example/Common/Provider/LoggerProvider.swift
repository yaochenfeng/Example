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
        boot(app)
    }
    
    func register(_ app: ApplicationContext) {}
    
    func boot(_ app: ApplicationContext) {
        guard app.isShared, !isBootstrap else { return }
        isBootstrap = true
        LoggingSystem.bootstrap { label in
            return MultiplexLogHandler(self.genLogHanlders(label))
        }
    }
    func genLogHanlders(_ label: String) -> [LogHandler] {
        var hanlders = [LogHandler]()
        if hanlders.isEmpty {
            hanlders.append(StreamLogHandler.standardError(label: label))
        }
        return hanlders
    }
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
            metadata = newValue
        }
    }
    
    var metadata: Logging.Logger.Metadata = .init()
    
    var logLevel: Logging.Logger.Level = .info
    // swiftlint:disable function_parameter_count
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
        DDLog.log(asynchronous: false, message: message)
    
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
