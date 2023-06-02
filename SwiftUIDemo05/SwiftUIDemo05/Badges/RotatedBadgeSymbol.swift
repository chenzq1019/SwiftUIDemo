//
//  RotatedBadgeSymbol.swift
//  SwiftUIDemo05
//
//  Created by 陈竹青 on 2023/6/2.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle,anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
