//
//  TransitionDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct TransitionDemo: View {
    @State var show = true
    var body: some View {
        demo02()
    }
    
    fileprivate func demo01() -> some View{
        VStack{
            Spacer()
            Text("Hello")
            if show {
                Text("World")
                    .transition(.slide)
            }
            Spacer()
            Button(show ? "Hide" : "Show"){
                show.toggle()
            }
        }.animation(.easeInOut(duration: 1.5), value: show)
            .frame(width: 300,height: 300)
    }
    
    fileprivate func demo02() -> some View{
        VStack {
                   VStack {
                       Spacer()
                       Text("Hello")
                       if show {
                           Text("World")
                               .transition(.rotation.combined(with: .opacity))
                       }
                       Spacer()
                   }
                   .animation(.easeInOut(duration: 2), value: show) // 在这里声明，Button 的文字将没有动画效果
                   Button(show ? "Hide" : "Show") {
                       show.toggle()
                   }
               }
       //        .animation(.easeInOut(duration: 2), value: show) // 如果在这里声明，对 Button 的文字同样有影响，结果如下图
               .frame(width: 300, height: 300)
               .onChange(of: show) {
                   print($0)
               }
    }
}


//自定义转场
struct MyTransition: ViewModifier { // 自定义转场的包装对象要求符合 ViewModifier 协议
    let rotation: Angle
    func body(content: Content) -> some View {
        content
            .rotationEffect(rotation) // 可动画部件
    }
}

extension AnyTransition {
    static var rotation: AnyTransition {
        AnyTransition.modifier(
            active: MyTransition(rotation: .degrees(360)),
            identity: MyTransition(rotation: .zero)
        )
    }
}

struct TransitionDemo_Previews: PreviewProvider {
    static var previews: some View {
        TransitionDemo()
    }
}
