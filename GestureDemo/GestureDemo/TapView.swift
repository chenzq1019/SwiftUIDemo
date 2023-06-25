//
//  TapView.swift
//  GestureDemo
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct TapView: View {
    @State var color: Color = .red
    var body: some View {
        VStack {
            Text("Tap the rectangle to change its color")
            Spacer()
            Rectangle()
                .foregroundColor(color)
                .frame(maxWidth: 250,maxHeight: 450)
                .gesture(tapGesture)
              
            Spacer()
        }
        .navigationTitle("Tap")
            .padding()
            .toolbar {
                ToolbarItem {
                    Button("Reset") {
                        color = .red
                    }
                }
            }
    }
    
    var tapGesture: some Gesture{
        TapGesture().onEnded {
            withAnimation {
                color = Color.random()
            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}

extension Color{
    static func random() -> Color{
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
