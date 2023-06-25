//
//  RollingRainBowView.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct RollingRainBowView: View {
    @State private var isAnimating = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 10)
    @State private var colors: [Color] = [.pink, .mint, .orange, .teal, .yellow, .cyan, .purple, .blue]
    
    @State private var offset = CGSize.zero
    @State private var scaleFactor : CGFloat = 1
    
    let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9)
    
    let numCircles = 100
    var body: some View {
        
        VStack {
            Text("Tap on the dots to make them roll")
                .padding(.vertical,30)
            Spacer()
            LazyVGrid(columns: gridColumns) {
                ForEach(0..<numCircles,id: \.self) { index in
                    Circle()
                        .foregroundColor(colors[index % colors.count])
                        .scaleEffect(scaleFactor)
//                        .offset(offset)
                        .animation(springAnimation.delay((Double(index).truncatingRemainder(dividingBy: 10) / 20)).repeatCount(2, autoreverses: true), value: scaleFactor)
//                        .onTapGesture {
//
//                                isAnimating.toggle()
//                                scaleFactor = (Double(index + 1) / 4)
//                        }
                }
            }
            .offset(offset)
            .gesture(DragGesture().onChanged({ value in
                offset = value.translation
                isAnimating = true
            }))
            Spacer()
            Button {
                withAnimation {
                    isAnimating.toggle()
                    scaleFactor = 1
                }
             
            } label: {
                Text("Reset")
            }

        }
    }
}

struct RollingRainBowView_Previews: PreviewProvider {
    static var previews: some View {
        RollingRainBowView()
    }
}
