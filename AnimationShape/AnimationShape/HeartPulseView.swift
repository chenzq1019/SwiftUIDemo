//
//  HeartPulseView.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct HeartPulseView: View {
    @State private var pulsing = false
    var body: some View {
        VStack{
            Spacer()
            if pulsing {
                PulsingHeart()
            }else{
                ResetHeart()
            }
            Spacer()
            Button {
                withAnimation {
                    pulsing.toggle()
                }
            } label: {
                Text("Reset")
            }

        }
    }
}

struct HeartPulseView_Previews: PreviewProvider {
    static var previews: some View {
        HeartPulseView()
    }
}
