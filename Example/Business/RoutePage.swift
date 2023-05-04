//
//  Route.swift
//  Example
//
//  Created by yaochenfeng on 2023/5/5.
//

import Foundation

enum RoutePage {
    case home
}

extension RoutePage {
    
    var controller: UIViewController {
        switch self {
        case .home:
            return UIViewController.rx.new.set(by: \.title, "首页").then { vc in
                vc.view.backgroundColor = .groupTableViewBackground
            }
        }
    }
}
