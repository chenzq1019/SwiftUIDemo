//
//  ListDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct ListDemo: View {
    let data = (0..<5)
    var body: some View {
        List() {
            Section(header: Text("Header")){
                ForEach(data,id: \.self) { _ in
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }.padding(0)
            
            Section(header: Text("Header"), footer: Text("Footer")){
                ForEach(data,id: \.self) { _ in
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }.padding(0)
        }
        .listStyle(.automatic)
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
