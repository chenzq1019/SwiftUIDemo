//
//  RotateView.swift
//  GestureDemo
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct RotateView: View {
    @State private var rotation = Angle.zero
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                rotation = angle
            }
            .onEnded { angle in
                rotation = angle
            }
    }
    
    var body: some View {
        VStack{
            Text("Use Two Finger to rotate the box")
            Spacer()
            Rectangle().foregroundColor(.red)
                .frame(width: 255,height: 255)
                .rotationEffect(rotation)
                .gesture(rotationGesture)
            Spacer()
            
        }.navigationTitle("Rotate")
            .padding()
            .toolbar {
                Button("Reset") {
                    rotation = Angle.zero
                }
            }
    }
}

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView()
    }
}
