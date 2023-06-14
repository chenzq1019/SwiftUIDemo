//
//  SymbolDetail.swift
//  EditingGrids
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct SymbolDetail: View {
    var symbol: Symbol
    var body: some View {
        VStack {
            Text(symbol.name).font(.system(.largeTitle,design: .rounded))
            Image(systemName: symbol.name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
        }
    }
}

struct SymbolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbol: Symbol(name: "magnifyingglass"))
    }
}
