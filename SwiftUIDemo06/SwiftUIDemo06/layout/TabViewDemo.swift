//
//  TabViewDeme.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct TabViewDemo: View {
    @State private var selection: Tab = .list
    
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection) {
            Text("Home")
                .tabItem{
               Label("Home",systemImage: "cart")
                }
                .tag(Tab.featured)
            Text("Cart").tabItem {
                Label("User",systemImage: "star")
                }
                .tag(Tab.list)
        }
    }
}



struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
