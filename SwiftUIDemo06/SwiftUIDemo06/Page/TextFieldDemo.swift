//
//  TextFieldDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/8.
//

import SwiftUI

struct TextFieldDemo: View {
    @State var name: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 10){//设置两个HStack的间距为10
            HStack{
                Text("昵称")
                TextField("输入您的姓名", text: $name,onEditingChanged: { changed in
                    print(changed)
                    print("=======\(name)")
                    
                })
                    .foregroundColor(.black)
                    .padding(10)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 50)
                    
            }
            HStack{
                Text("密码")
                SecureField("输入您的密码", text: $password)//密码输入
                    .foregroundColor(.red)
                    .keyboardType(.numberPad)
                    .padding(10)
                    .textFieldStyle(.roundedBorder)
            }
        }.padding()
            .navigationBarTitle("TextField")
    }
}

struct TextFieldDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo()
    }
}
