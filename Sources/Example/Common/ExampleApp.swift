//
//  ExampleApp.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/21.
//

import Foundation

@main
struct ExampleApp {
    static func main() {
        // 注册服务
        DF.addProvider(AppProvider.self)
        AppAdaptor.main()
    }
}
