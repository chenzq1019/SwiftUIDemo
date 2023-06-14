//
//  ToggleDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct ToggleDemo: View {
    @State var selected: Bool = false
    var body: some View {
        VStack{
            Toggle("状态", isOn: $selected).padding()
            if selected {
                Text("打开")
            }else{
                Text("关闭")
            }
        }
        
    }
}

struct ToggleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ToggleDemo()
    }
}
