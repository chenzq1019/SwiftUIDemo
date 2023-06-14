//
//  ButtonDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
        VStack(spacing: 20){
            Button {
                print("按键点击")
            } label: {
                Text("按键标题")
            }
            .foregroundColor(.black)
            .font(.system(size: 25))
           
            Button("我是按键", role: .destructive) {
                print("按键点击")
            }
            Button {
                print("按键点击")
            } label: {
                Label("Home", systemImage: "star")
            }
            //图文按键左右
            Button {
                print("按键点击")
            } label: {
                Label("点赞", image: "star").labelStyle(.automatic)
            }

            //图文按键（上下）
            Button {
                print("按键点击")
            } label: {
                VStack(spacing: 5){
                    Image("star")
                    Text("点赞")
                }.padding(5).frame(width: 60,height: 60)
            }.background(.gray).cornerRadius(10)
            //利用labelStyle自定义一个lable
            Label("Home",systemImage: "star").labelStyle(HStackLabel())


        }
        .navigationBarItems(trailing: EditButton())
        .navigationTitle(Text("Button"))
        .navigationBarTitleDisplayMode(.inline)//在导航栏中间显示
    }
}

struct HStackLabel: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            configuration.icon
            configuration.title
        }
    }
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}
