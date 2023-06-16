//
//  ContentView.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor).onTapGesture {
                    asyFuncTest()
                }
            Text("Hello, world!")
        }
        .padding()
    }
    func asyFuncTest(){
        print("1111111")
        Task {
            print("22222222")
        }
        Task{ @MainActor in
            print("33333333")
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
