//
//  KeywordBubble.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct KeywordBubble: View {
    let keyword: String
    let symbol: String
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.title)
            .foregroundColor(.white)
            .padding(paddingWidth)
            .background(.purple.opacity(0.75), in: Capsule())
        
    }
}

struct KeywordBubble_Previews: PreviewProvider {
    static let keywords = ["chives", "fern-leaf lavender"]
    static var previews: some View {
        VStack{
            ForEach(keywords,id: \.self){ keywod in
                KeywordBubble(keyword: keywod, symbol: "leaf")
            }
           
        }
    }
}
