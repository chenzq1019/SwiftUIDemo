//
//  RecipeListItemView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI


struct RecipeListItemView: View {
    var recipe: Recipe
    var body: some View {
        HStack{
            recipe.smallImage.resizable()
                .frame(width: 60 ,height: 60).cornerRadius(4)
            VStack(alignment: .leading){
                Text(recipe.title).font(.title3)
                Text(recipe.subtitle).font(.caption)
            }
            Spacer()
            if(recipe.isFavorite){
                Image(systemName: "heart").symbolVariant(.fill)
            }
        }
    }
}



//struct RecipeListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeListItemView()
//    }
//}
