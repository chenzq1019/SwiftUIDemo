//
//  AlertViewDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct AlertViewDemo: View {
    @State var showAlert: Bool =  false
    var body: some View {
        Button {
            self.showAlert = true
        } label: {
            Text("Click")
                .font(.system(size: 30,design: .rounded))
                
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("温馨提示"),message: Text("你确定退出应用吗？"), primaryButton: .cancel(Text("取消"),action: {
                print("取消退出")
            }), secondaryButton: .destructive(Text("确定"),action: {
                print("确定退出")
            }))
        }

    }
}

struct AlertViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        AlertViewDemo()
    }
}
