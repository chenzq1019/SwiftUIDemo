//
//  SizingView.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct SizingView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.brown).frame(maxWidth: 200,maxHeight: 150)
                VStack{
                    Text("Rose are red.")
                    Image("Pink_Peony")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                        .foregroundColor(.red)
                    Text("villets are blue")
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.brown)
                VStack{
                    Text("I just love")
                    Image(systemName: "heart.fill").resizable()
                        .scaledToFit().frame(maxWidth: 50).foregroundColor(.red)
                    Text("coding with you ")
                }
            }.frame(maxWidth: 200 ,maxHeight: 150)
        }
        .foregroundColor(.white)
        .font(.headline)
    }
}

struct SizingView_Previews: PreviewProvider {
    static var previews: some View {
        SizingView()
    }
}
