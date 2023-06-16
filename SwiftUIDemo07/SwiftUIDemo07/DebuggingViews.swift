//
//  DebuggingViews.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI


struct HalfCard: View {
    var body: some View{
        VStack{
//            Spacer()
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .overlay(alignment: .topLeading){
            VStack{
                Image(systemName: "crown.fill").font(.body)
                Text("Q").font(.largeTitle)
                Image(systemName: "heart.fill").font(.title)
            }
            .padding()
        }
    }
}

struct DebuggingViews: View {
    var body: some View {
        VStack{
            HalfCard()
            HalfCard().rotationEffect(Angle(degrees: 180))
        }.background {
            RoundedRectangle(cornerRadius: 10).stroke(.black)
        }
        .aspectRatio(0.75, contentMode: .fit)
        .foregroundColor(.red)
        .padding()
    }
}

struct DebuggingViews_Previews: PreviewProvider {
    static var previews: some View {
        DebuggingViews()
    }
}
