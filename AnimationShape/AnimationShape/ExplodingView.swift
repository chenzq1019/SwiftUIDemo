//
//  ExplodingView.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct ExplodingView: View {
    @State private var isExploded = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<75) { _ in
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<180)))
                        .frame(width: 20,height: 20)
                        .foregroundColor(.indigo)
                        .offset(x: isExploded ?  0 :(Double.random(in: -1...1) * 300) ,y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                        .padding()
                    
                }
                Rectangle()
                    .frame(width: 300 ,height: 300)
                    .foregroundColor(.indigo)
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.6), value: isExploded)
                    .padding()
            }
            Spacer()
            Button("Reset"){
//                withAnimation {
                    isExploded.toggle()
//                }
            }
        }
    }
}

struct ExplodingView_Previews: PreviewProvider {
    static var previews: some View {
        ExplodingView()
    }
}
