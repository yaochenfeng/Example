//
//  import.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/16.
//

import DFService
typealias URLRouter = URLRoutePipeline
let DF = ApplicationContext.shared
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
class CommomProvider: DFProviderType {
    var isBootstrap: Bool = false
    
    required init(_ app: DFService.ApplicationContext) {
        
    }
    
    func register(_ app: DFService.ApplicationContext) {
        setUITheme()
    }
    
    func boot(_ app: DFService.ApplicationContext) {
        
    }
    
}
extension CommomProvider {
    @available(iOS 10.0, *)
    func setUITheme() {
        let navigationBar: UINavigationBar = UINavigationBar.appearance()
        navigationBar.prefersLargeTitles = false
    }
    
}
