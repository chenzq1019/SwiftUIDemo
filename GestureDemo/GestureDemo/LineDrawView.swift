//
//  LineDrawView.swift
//  GestureDemo
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct LineDrawView: View {
    

    @State private var start : CGPoint = CGPoint.zero
    @State private var end: CGPoint = CGPoint.zero
    
    var lineDrawingGesture: some Gesture{
        DragGesture()
            .onChanged { value in
                start = value.startLocation
                end = value.location
            }
            .onEnded { value in
                end = value.location
            }
    }
    
    var body: some View {
        VStack{
            Text("Touch and drag to make a line")
            Spacer()
            ZStack{
                Path { path in
                    path.move(to: start)
                    path.addLine(to: end)
                }      .stroke(Color.green,lineWidth: 8.0)
                    .contentShape(Rectangle())
                    .gesture(lineDrawingGesture)
            }
            Spacer()
            
                
        }
    }
}

struct LineDrawView_Previews: PreviewProvider {
    static var previews: some View {
        LineDrawView()
    }
}
