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
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Text("版本 \(Bundle.appVersion)")
                    Spacer()
                }
            }
        }
        
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
