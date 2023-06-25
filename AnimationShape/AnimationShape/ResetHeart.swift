//
//  ResetHeart.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct ResetHeart: View {
    var body: some View {
        Heart().frame(width: 100 ,height: 100)
            .foregroundColor(.red)
            .shadow(color: .pink, radius: 10)
            .frame(width: 300,height: 300)
            .border(.blue)
            
    }
}

struct ResetHeart_Previews: PreviewProvider {
    static var previews: some View {
        ResetHeart()
    }
}
