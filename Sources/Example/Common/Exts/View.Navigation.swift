//
//  View.If.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/19.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    func setNavigate(_ title: Binding<String>) -> some View {
        if #available(iOS 16.0, *) {
            return self.navigationTitle(title)
        } else {
            return self.navigationBarTitle(Text(title.wrappedValue))
        }
    }
    func setNavigate(_ title: Text) -> some View {
        return self.navigationBarTitle(title)
    }
}
