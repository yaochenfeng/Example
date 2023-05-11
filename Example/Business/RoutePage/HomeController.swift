//
//  HomeController.swift
//  Example
//
//  Created by yaochenfeng on 2023/5/11.
//

import UIKit

class HomeController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: RoutePage.second.routeId, style: .done, target: nil, action: nil).rx.then({ base in
            base.rx.tap.map { _ in
                RoutePage.second.navigate()
            }.subscribe().disposed(by: rx.disposeBag)
        })
    }
}
