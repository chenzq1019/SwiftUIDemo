//
//  AnimationDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct AnimationDemo: View {
    @State var animated = false
    @State var red = false
    @State var x : CGFloat = 0
    @State var y : CGFloat = 0
    @State var items = (0...3).map { $0 }
    @State var startAnimation = false
    @State var startAnimation2 = false
    var body: some View {
        demo05()
    }
    
    fileprivate func demo01() ->some View {
      return  VStack(alignment: .leading) {
                   Text("Hello world")
                            .offset(x: animated ? 200 : 0)
                   Text("Fat")
                       .offset(x: animated ? 200 : 0)
                    Button {
                        self.animated.toggle()
                    } label: {
                        Text("开始动画")
                    }
                }
                .animation(.easeInOut, value: animated) //
    }
    
    fileprivate func demo02() -> some View{
        //Demo 2
            VStack{
                Spacer()
                Circle().fill(red ? .red : .blue)
                    .frame(width: 30 , height: 30)
                    .offset(x: x, y: y)
    //                .animation(.easeInOut(duration: 1), value: red)
                Spacer()
                Button {
                    withAnimation(.easeInOut) {
                        if x == 0 {
                            x = 100
                        }else {
                            x = 0
                        }
                        red.toggle()
                    }
                    
                    withAnimation(.linear) {
                        if y == 0 {
                            y = 100
                        }else {
                            y = 0
                        }
                        red.toggle()
                    }
                } label: {
                    Text("Animate")
                }
            }
    }
    
    fileprivate func demo03() -> some View{
        VStack {
            Button("In withAnimation") {
                withAnimation(.easeInOut) {
                    items.append(Int.random(in: 0...1000))
                }
            }
            Button("Not in withAnimation") { // 使用 Array 的扩展方法
                items.appendWithAnimation(Int.random(in: 0...1000), .easeInOut)
            }
            List {
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                }
            }
            .frame(width: 500, height: 300)
        }
    }
    
    fileprivate func demo04() -> some View{
        VStack {
                   AnimationDataMonitorView(number: startAnimation ? 100 : 0) // 声明两种状态下的形态
                       .animation(.linear(duration: 1.3), value: startAnimation) // 关联依赖项和时序曲线函数
                   Button("Show Data") {
                       AnimationDataMonitorView.timestamp = Date()
                       startAnimation.toggle() // 改变依赖项
                   }
               }
               .frame(width: 300, height: 300)
    }
    
    
    fileprivate func demo05() -> some View{
        VStack {
                   AnimationDataMonitor2View(number1: startAnimation ? 100 : 0, prefix: "时间：", number2: startAnimation2 ? 100 : 0) // 声明两种状态下的形态
                   Button("Show Data") {
                       AnimationDataMonitor2View.timestamp = Date()
                       withAnimation(.linear) {
                           startAnimation.toggle()
                                }
                        withAnimation(.easeInOut) {
                                          startAnimation2.toggle()
                                      }
                   }
               }
               .frame(width: 300, height: 300)
    }
}

struct AnimationDataMonitorView: View, Animatable {
   static var timestamp = Date()
   var number: Double
   var animatableData: Double { // SwiftUI 在渲染时发现该视图为 Animatable，则会在状态已改变后，依据时序曲线函数提供的值持续调用 animableData
      
       get { number }
       set { number = newValue }
   }
   var body: some View {
       let duration = Date().timeIntervalSince(Self.timestamp).formatted(.number.precision(.fractionLength(2)))
       let currentNumber = number.formatted(.number.precision(.fractionLength(2)))
       let _ = print(duration, currentNumber, separator: ",")
      return Text(number, format: .number.precision(.fractionLength(2)))
   }
}

struct AnimationDataMonitor2View: View, Animatable {
   static var timestamp = Date()
   var number1: Double // 会发生变化
   let prefix: String
   var number2: Double // 会发生变化
    //当可动画元素有多个可变依赖项时，需将 animatableData 设置为 AnimatablePair 类型，以便 SwiftUI 可以传递分属于不同依赖项的动画插值数据。
   var animatableData: AnimatablePair<Double, Double> {
       get { AnimatablePair(number1, number2) }
       set {
           number1 = newValue.first
           number2 = newValue.second
       }
   }
   var body: some View {
       let duration = Date().timeIntervalSince(Self.timestamp).formatted(.number.precision(.fractionLength(2)))
       let currentNumber1 = number1.formatted(.number.precision(.fractionLength(2)))
       let currentNumber2 = number2.formatted(.number.precision(.fractionLength(2)))
       let _ = print(duration, currentNumber1, currentNumber2, separator: ",")
       return HStack {
           Text(prefix)
               .foregroundColor(.green)
           Text(number1, format: .number.precision(.fractionLength(3)))
               .foregroundColor(.red)
           Text(number2, format: .number.precision(.fractionLength(3)))
               .foregroundColor(.blue)
       }
   }
}


extension Array {
    ///，在 Array 的扩展方法 appendWithAnimation 中使用了 withAnimation ，但由于 withAnimation 的闭包中没有包含特定的依赖项，因此并不会激活 SwiftUI 的动画机制。
   mutating func appendWithAnimation(_ newElement: Element, _ animation: Animation?) {
       withAnimation(animation) {
           append(newElement)
       }
   }
}


struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
