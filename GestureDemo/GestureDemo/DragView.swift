//
//  DragView.swift
//  GestureDemo
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct DragView: View {
    
    private var cirleSize: CGFloat = 100
    @State private var offset: CGSize = CGSize.zero
    
    var dragGesture: some Gesture{
        DragGesture().onChanged { value in
            offset = CGSize(width: value.startLocation.x + value.translation.width - cirleSize/2, height: value.startLocation.y + value.translation.height - cirleSize/2)
        }
    }
    
    var body: some View {
        VStack{
            Text("Use one finger to drag the circle around")
            Spacer()
            Circle()
                .foregroundColor(.teal)
                .frame(width: cirleSize,height: cirleSize)
                .offset(offset)
                .gesture(dragGesture)
            Spacer()
        }.navigationTitle("Drag")
            .padding()
            .toolbar {
                Button("Rest") {
                    offset = CGSize.zero
                }
            }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
