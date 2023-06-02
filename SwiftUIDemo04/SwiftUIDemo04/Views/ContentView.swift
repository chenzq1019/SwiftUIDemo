//
//  ContentView.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        //使用TabView 切换页面类似OC的TabBar
        TabView(selection: $selection) {
            CategoryHome().environmentObject(ModelData())
                .tabItem({
                    Label("Featured",systemImage: "star")
                })
                .tag(Tab.featured)
            
            LandmarkList().environmentObject(ModelData())
                .tabItem({
                    Label("List",systemImage: "list.bullet")
                })
                .tag(Tab.featured)
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
