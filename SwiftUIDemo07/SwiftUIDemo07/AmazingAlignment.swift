//
//  AmazingAlignment.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct AmazingAlignment: View {
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "books.vertical.fill").font(.system(size: 40))
            Rectangle()
                .frame(maxHeight: 10)
            VStack(alignment: .trailing) {
                Image(systemName: "books.vertical.fill").font(.system(size: 40))
                Rectangle()
                    .frame(maxHeight: 10)
            }
            //第二种布局方式
            Image(systemName: "books.vertical.fill").font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Rectangle()
                .frame(maxHeight: 10)
            //第三种，利用Spacer
            HStack{
                Spacer()
                Image(systemName: "books.vertical.fill").font(.system(size: 40))
                Image(systemName: "books.vertical.fill").font(.system(size: 40)).padding(.trailing,20)
            }
            .background(.blue)
            Rectangle()
                .frame(maxHeight: 10)
        }
        .padding(.horizontal)
        .frame(width: 250)
        .border(.black)
        
    }
}

struct AmazingAlignment_Previews: PreviewProvider {
    static var previews: some View {
        AmazingAlignment()
    }
}
