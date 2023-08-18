//
//  CommonProvider.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/17.
//

/// 项目公共Provider
class AppProvider: DFProviderType {
    var isBootstrap: Bool = false
    
    required init(_ app: ApplicationContext) {
        for provider in providers {
            app.addProvider(provider)
        }
    }
    
    func register(_ app: ApplicationContext) {}
    
    func boot(_ app: ApplicationContext) {}
    
    var providers: [DFProviderType.Type] = [
        LoggerProvider.self,
        DebugProvider.self,
        RouteProvider.self,
    ]
}
