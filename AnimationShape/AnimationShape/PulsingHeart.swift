//
//  PulsingHeart.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct PulsingHeart: View {
    @State private var heartPulse : CGFloat = 1
    var body: some View {
        Heart()
            .frame(width: 100,height: 100)
            .foregroundColor(.red)
            .scaleEffect(heartPulse)
            .shadow(color: .pink,  radius: 10)
            .onAppear{
                withAnimation (.easeInOut.repeatForever(autoreverses:true)){
                    heartPulse = 1.25 * heartPulse
                }
            }
    }
}

struct PulsingHeart_Previews: PreviewProvider {
    static var previews: some View {
        PulsingHeart()
    }
}
