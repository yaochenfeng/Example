//
//  AboutMeView.swift
//  Example
//
//  Created by yaochenfeng on 2023/8/20.
//

import SwiftUI

struct AboutMeView: View {
    var body: some View {
        List {
            Section {
                RouteLinkView("https://m.baidu.com") {
                    Text("隐私协议")
                }
                RouteLinkView("https://m.baidu.com") {
                    Text("用户协议")
                }
            } header: {
                HStack(alignment: .center) {
                    Spacer()
                    VStack {
                        Image(Asset.appIcon60x60.name)
                        Text("版本\(DF.environment.appVersion) - \(DF.environment.appBuild)")
                        Spacer(minLength: 40)
                    }
                    Spacer()
                    
                }
                
            }
            
        }
        
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        RootView {
            AboutMeView()
        }
    }
}
