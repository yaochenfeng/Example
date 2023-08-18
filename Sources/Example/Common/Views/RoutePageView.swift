//
//  RoutePageView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/18.
//

import SwiftUI
@available(iOS 13.0, macOS 11.0, *)
struct RoutePageView: View {
    let url: URL?
    var body: some View {
        builderView(url)
    }
    
    func builderView(_ url: URL?) -> AnyView {
        var view: any View = builderEmpty()
        guard let url = url else {
            return AnyView(view)
        }
        do {
            let output = try router.process(url)
            if let value = output as? (any View) {
                view = value
            }
        } catch {
            view = builderError(error)
        }
        return AnyView(view)
    }
    func builderError(_ error: Error) -> some View {
        Text("路由错误\(error.localizedDescription)")
    }
    
    func builderEmpty() -> some View {
        Text("找不到对应路由")
            .setNavigate(Text("错误"))
        
    }
}
@available(iOS 13.0, macOS 11.0, *)
struct RoutePageView_Previews: PreviewProvider {
    static var previews: some View {
        RootView {
            RoutePageView(url: nil)
        }
    }
}
