//
//  ContentView.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/2.
//

import SwiftUI

struct ContentView: View {
//    var lists: [String] = ["Text","TextField"]
    var body: some View {
        NavigationView {
            List{
                Section("基础控件") {
                    NavigationLink {
                        TextDemo(title: "Text")
                    } label: {
                        Text("Text")
                    }
                    NavigationLink {
                        TextFieldDemo()
                    } label: {
                        Text("TextField")
                    }
                    NavigationLink {
                        ImageDemo()
                    } label: {
                        Text("Image")
                    }
                    NavigationLink {
                        ButtonDemo()
                    } label: {
                        Text("Button")
                    }
                    NavigationLink {
                        PickerDemo()
                    } label: {
                        Text("Pick")
                    }
                }
                Section("UIKit"){
                    NavigationLink {
                        WebViewDemo()
                    } label: {
                        Text("WKWebView")
                    }
                    
                    NavigationLink {
                        UIViewControlloerDemo(title:"UIViewController")
                    } label: {
                        Text("UIViewController")
                    }
                }
                
                Section("布局") {
                    NavigationLink {
                        HStackDemo()
                    } label: {
                        Text("HStack")
                    }
                    NavigationLink {
                        ListDemo()
                    } label: {
                        Text("List")
                    }
                    NavigationLink{
                        GridViewDemo(viewModel: EmojiMeoryGame())
                    } label: {
                        Text("GridView")
                    }
                }
                Section("动画") {
                    NavigationLink {
                        AnimationDemo()
                    } label: {
                        Text("Animation")
                    }
                  
                }
      
            }
            .navigationTitle("Example")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
