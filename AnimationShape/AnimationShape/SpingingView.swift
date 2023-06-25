//
//  SpingingView.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct SpingingView: View {
    @State private var isSpinning = false
    var body: some View {
        VStack{
            Spacer()
            if isSpinning{
                SpingEllipse()
            }else{
                ResetEllipse()
            }
            Spacer()
            Button {
                withAnimation {
                    isSpinning.toggle()
                }
            } label: {
                Text("Reset")
            }

        }
    }
}

struct SpingingView_Previews: PreviewProvider {
    static var previews: some View {
        SpingingView()
    }
}
