//
//  SpingEllipse.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct SpingEllipse: View {
    @State private var width: CGFloat = 200
    var body: some View {
        Ellipse()
            .frame(width: width,height: 200)
            .foregroundColor(.orange)
            .onAppear{
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    width = 0
                }
            }
    }
}

struct SpingEllipse_Previews: PreviewProvider {
    static var previews: some View {
        SpingEllipse()
    }
}
