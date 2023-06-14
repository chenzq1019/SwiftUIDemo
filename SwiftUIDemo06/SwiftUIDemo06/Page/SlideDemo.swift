//
//  SlideDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct SlideDemo: View {
    @State var value: CGFloat = 0.5
    var body: some View {
        VStack{
            Text("slider value is \(value)")
            Slider(value: $value)
                .padding()
        }
    }
}

struct SlideDemo_Previews: PreviewProvider {
    static var previews: some View {
        SlideDemo()
    }
}
