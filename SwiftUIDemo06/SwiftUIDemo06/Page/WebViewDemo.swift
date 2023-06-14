//
//  WebViewDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI
import WebKit

struct WebViewDemo: View {
    var body: some View {
        WebView().padding(0)
            .navigationTitle(Text("Web"))
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct WebView: UIViewRepresentable{
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
       return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: URL(string: "https://www.baidu.com")!)
        uiView.load(request)
    }
    
    class Coordinator: NSObject{
        var web : WebView
        init(_ webView: WebView){
            web = webView
        }
    }
}

struct WebViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        WebViewDemo()
    }
}
