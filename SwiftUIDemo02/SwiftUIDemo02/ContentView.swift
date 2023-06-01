//
//  ContentView.swift
//  SwiftUIDemo02
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("我是一个Text")
            Label("Lightning", systemImage: "bolt.fill")
            Label("Lightning", systemImage: "bolt.fill")
                    .labelStyle(.iconOnly)
            Label("Lightning", systemImage: "bolt.fill")
            
            //多label统一样式
             VStack {
                 Label("Rain", systemImage: "cloud.rain")
                 Label("Snow", systemImage: "snow")
                 Label("Sun", systemImage: "sun.max")
             }
             .labelStyle(.iconOnly)
            
            //组合标签
            Label {
                   Text("wenyi")
                       .font(.body)
                       .foregroundColor(.primary)
                   Text("ya")
                       .font(.subheadline)
                       .foregroundColor(.secondary)
               } icon: {
                   Circle()
                       .fill(.orange)
                       .frame(width: 30, height: 30, alignment: .center)
                       .overlay(Text("圆")).foregroundColor(.white)
               }
            //Link
            Link(destination: URL(string:"https://www.baidu.com/")!) {
                Text("Link")
            }
                
            Link("View Our Terms of Service",
                  destination: URL(string: "https://www.example.com/TOS.html")!)
                  
            //设置OpenURLAction
            Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
                .environment(\.openURL, OpenURLAction { url in
                    print("Open \(url)")
                    return .handled
                                })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
