//
//  Route.swift
//  Example
//
//  Created by yaochenfeng on 2023/5/5.
//

import Foundation

enum RoutePage: String {
    case home
    case second
}

extension RoutePage {
    
    var controller: UIViewController {
        switch self {
        case .home:
            return HomeController.rx.new.set(by: \.title, "首页").then { vc in
                vc.view.backgroundColor = .groupTableViewBackground
            }
        case .second:
            return SecondController.rx.new.set(by: \.title, "第二页").base
        }
    }
}

extension RoutePage: RXRouteConvertible {
    init?(string: String) {
        self.init(rawValue: string)
    }
    
    var routeId: String {
        return rawValue
    }
    
    func getController() -> UIViewController? {
        return controller
    }
}
