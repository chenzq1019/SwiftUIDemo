//
//  HStackDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct HStackDemo: View {
    var body: some View {
        VStack {
            HStack {
                Text("第一列")
                Spacer()
                Text("第二列")
                Spacer()
            }
            Divider()
            VStack(spacing: 10){
                Text("第一行")
                Text("第二行")
            }.padding()
        }.padding()
        
    }
}

struct HStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        HStackDemo()
    }
}
