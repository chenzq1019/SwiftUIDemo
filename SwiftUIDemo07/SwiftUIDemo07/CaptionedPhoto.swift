//
//  CaptionedPhoto.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct CaptionedPhoto: View {
    let assetName: String
    let contentStr: String
    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                Caption(text: contentStr)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
    }
}

struct Caption: View {
    let text: String
    var body: some View{
        Text(text)
            .padding()//注意这个padding 的顺序
            .foregroundColor(.black)
            .frame(height: 50).background(.white.opacity(0.5) , in: RoundedRectangle(cornerRadius: 10))
            .padding()
    }
}

struct CaptionedPhoto_Previews: PreviewProvider {
    static let imageName = "Pink_Peony"
    static let describ = "This photo is wider than it is tall."
    static var previews: some View {
        CaptionedPhoto(assetName: imageName,contentStr: describ)
    }
}
