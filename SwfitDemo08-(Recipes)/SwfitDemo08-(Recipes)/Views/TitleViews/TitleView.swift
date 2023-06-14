//
//  TitleView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct TitleView: View {
    @Binding var recipe: Recipe
    var body: some View {
        VStack{
            VStack(spacing: 2){
                Text(recipe.title).font(.title)
                HStack{
                    Spacer()
                    ForEach(0..<5){index in
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                Text(recipe.subtitle)
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.primary
                .colorInvert()
                .opacity(0.75))
        }
    }
}

//struct TitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleView()
//    }
//}
