//
//  import.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/16.
//

import DFService

typealias URLRouter = DFService.RoutePipeline
typealias DFProviderType = DFService.DFProviderType
typealias ApplicationContext = DFService.ApplicationContext

let DF = ApplicationContext.shared
let router = RoutePipeline()

extension Logger {
    init(_ cls: AnyClass) {
        self.init(label: String(describing: cls))
    }
}
