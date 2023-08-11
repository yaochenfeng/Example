//
//  App+root.swift
//  Example
//
//  Created by yaochenfeng on 2023/4/28.
//

import UIKit
import RXKit

extension MainAppWrapper {
    /// 项目根控制器
    static func rootController() -> UIViewController {
        return RXNavigationController.shared.rx.then { base in
            base.navigationBar.tintColor = Asset.accentColor.color
            base.setViewControllers([RoutePage.home.controller], animated: false)
        }
    }
}
