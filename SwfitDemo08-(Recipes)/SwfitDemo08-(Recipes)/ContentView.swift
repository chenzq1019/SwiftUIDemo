//
//  ContentView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recipeBox = RecipeBox(recipes: load("recipeData.json"))
    @State private var selectedSidebarItem: SidebarItem? = SidebarItem.all
    @State private var selectedRecipeId: Recipe.ID?
    
    private var recipe: Binding<Recipe> {
        Binding {
            if let id = selectedRecipeId {
                return recipeBox.recipe(with: id) ?? Recipe.emptyRecipe()
            } else {
                return Recipe.emptyRecipe()
            }
        } set: { updatedRecipe in
            recipeBox.update(updatedRecipe)
        }
    }
    var body: some View {
        NavigationSplitView {
            SiderBarView(selection: $selectedSidebarItem,recipeBox:recipeBox)
        } content: {
            ContentListView(selection: $selectedRecipeId, selectedSidebarItem: selectedSidebarItem ?? SidebarItem.all)
                    .environmentObject(recipeBox)
        } detail: {
            DetailView(recipeId: $selectedRecipeId, recipe: recipe)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
