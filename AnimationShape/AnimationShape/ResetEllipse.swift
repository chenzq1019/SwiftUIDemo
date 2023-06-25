//
//  ResetEllipse.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct ResetEllipse: View {
    var body: some View {
        Ellipse().frame(width: 200 ,height: 200)
            .foregroundColor(.orange)
    }
}

struct ResetEllipse_Previews: PreviewProvider {
    static var previews: some View {
        ResetEllipse()
    }
}
