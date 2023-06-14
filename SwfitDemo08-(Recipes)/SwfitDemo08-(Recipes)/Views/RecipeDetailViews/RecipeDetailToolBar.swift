//
//  RecipeDetailToolBar.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct RecipeDetailToolBar: ToolbarContent {
    @Binding var recipe: Recipe
    var body: some ToolbarContent {
        ToolbarItem {
            Toggle(isOn: $recipe.isFavorite) {
                Image(systemName: "heart")
                    .symbolVariant(recipe.isFavorite ? .fill : .none)
            }
            .toggleStyle(.button)
//            Image(systemName: "heart")
        }
        ToolbarItem {
            Button(role: .destructive) {
                
            } label: {
                Image(systemName: "trash")
            }

        }
    }
}

