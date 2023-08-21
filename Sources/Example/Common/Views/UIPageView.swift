//
//  UIPageView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/22.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
public struct UIPageView<Page: UIViewController>: UIViewControllerRepresentable {
    let builder: () -> UIViewControllerType
    public init(_ builder: @escaping () -> UIViewControllerType) {
        self.builder = builder
    }
    public func makeUIViewController(context: Context) -> UIViewControllerType {
        return builder()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    public typealias UIViewControllerType = Page
}
#endif
