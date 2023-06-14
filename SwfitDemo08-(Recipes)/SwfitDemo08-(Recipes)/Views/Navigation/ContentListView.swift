//
//  ContentListView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct ContentListView: View {
    @Binding var selection: Recipe.ID?
    let selectedSidebarItem: SidebarItem
    @EnvironmentObject private var recipeBox: RecipeBox
    var body: some View {
        RecipeListView(selection: $selection, selectedSidebarItem: selectedSidebarItem)
            .navigationTitle("列表")
    }
}

//struct ContentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentListView()
//    }
//}
