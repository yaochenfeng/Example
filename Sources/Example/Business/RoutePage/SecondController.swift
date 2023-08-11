//
//  SecondController.swift
//  Example
//
//  Created by yaochenfeng on 2023/5/11.
//

import UIKit

class SecondController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UILabel.rx.new.set(by: \.text, "hello").add2(view).layout { mk in
            mk.center.equalToSuperview()
        }
    }

}
