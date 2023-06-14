//
//  RecipeListView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var selection: Recipe.ID?
    let selectedSidebarItem: SidebarItem
    @EnvironmentObject private var recipeBox: RecipeBox
    var body: some View {
        List(recipes, selection: $selection) { recipe in
            NavigationLink(value: recipe.id) {
                    RecipeListItemView(recipe: recipe)
            }
        }
    }
    
    private var recipes: [Recipe] {
        switch selectedSidebarItem {
        case .all:
            return recipeBox.allRecipes
        case .favorites:
            return recipeBox.favoriteRecipes()
        case .recents:
            return recipeBox.recentRecipes()
        case .collection(let name):
            return recipeBox.recipesInCollection(name)
        }
    }
}

//struct RecipeListView_Previews: PreviewProvider {
//    static var recipeBox = RecipeBox(recipes: load("recipeData.json"))
//    static var previews: some View {
//        RecipeListView().environmentObject(recipeBox)
//    }
//}
