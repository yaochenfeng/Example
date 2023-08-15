//
//  MenuView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/15.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
struct MenuView: Commands {
    var body: some Commands {
        CommandMenu("My Menu") {
            Button("menu1") {
                print("menu1")
            }
        }
    }
}
