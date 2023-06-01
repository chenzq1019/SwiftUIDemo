//
//  ContentView.swift
//  SwiftUIDemo01
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct ContentView: View {
    //创建两个变量，分别用来记录体重和很高的输入值
    //使用@State修饰，可以用来绑定知道个变量到某个视图上
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    var body: some View {
        //VStack是垂直布局，子视图是垂直布局显示的
        VStack{
            Text("BMI Calculator:").font(.largeTitle)
            //第二个参数是获取输入的文本，分别传递给了变量weightText和heightText，此时需要使用$来标识
            TextField("Enter Weight (in kilograms)", text: $weightText).border(Color.black).textFieldStyle(.roundedBorder).padding()
            TextField("Enter Height (in meters)", text: $heightText).border(Color.black).textFieldStyle(.roundedBorder).padding()
            Button {
                let weight = Double(self.weightText)!
                let height = Double(self.heightText)!
                self.bmi = weight/(height * height)
                if self.bmi < 18.5 {
                    self.classification = "Underweight"
                }else if self.bmi < 24.9{
                    self.classification = "Healthy weight"
                }else if self.bmi < 29.9{
                    self.classification = "Overweight"
                }else{
                    self.classification = "Obese"
                }
                
            } label: {
                Text("Calculate BMI").padding().foregroundColor(.white).background(Color.blue)
            }
            Text("BMI:  \(bmi,specifier: "%.1f") ,\(classification)").font(.title).padding()

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
