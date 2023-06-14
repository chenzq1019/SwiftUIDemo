//
//  DetailView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct DetailView: View {
    @Binding var recipeId: Recipe.ID?
    @EnvironmentObject private var recipeBox: RecipeBox
    @State private var showDeleteConfirmation = false
    @Binding var recipe: Recipe
   
    var body: some View {
        VStack{
            TitleView(recipe: $recipe)
                .frame(height: 300,alignment: .bottom)
                .background {
                    recipe.fullImage
                        .resizable()
                        .aspectRatio(contentMode:.fill)
                }
            Spacer()
                
        }
        .navigationTitle(Text(recipe.title))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            RecipeDetailToolBar(recipe: $recipe)
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var recipeBox = RecipeBox(recipes: load("recipeData.json"))
//    static var recipe : Recipe = recipeBox.allRecipes[0]
//    static var previews: some View {
//        DetailView(recipeId:recipe.id,  recipe: recipeBox.allRecipes[0])
//    }
//}
