//
//  SiderBarView.swift
//  SwfitDemo08-(Recipes)
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

enum SidebarItem: Hashable {
    case all, favorites, recents
    case collection(String)
    var title: String{
        switch self{
        case .all:
            return "All Recipes"
        case .favorites:
            return "Favorites"
        case .recents:
            return "Recents"
        case .collection(let name):
            return name
        }
    }
}

struct SiderBarView: View {

    @Binding var selection: SidebarItem?
    @ObservedObject var recipeBox: RecipeBox
    var body: some View {
        List(selection: $selection) {
            Section("Library") {
                NavigationLink(value: SidebarItem.all) {
                    Text(SidebarItem.all.title)
                }
                NavigationLink(value: SidebarItem.favorites) {
                    Text(SidebarItem.favorites.title)
                }
                NavigationLink(value: SidebarItem.recents) {
                    Text(SidebarItem.recents.title)
                }
            }
            Section("Collection") {
                ForEach(recipeBox.collections,id:\.self){ collectionName in
                    NavigationLink(value: SidebarItem.collection(collectionName)) {
                        Text(collectionName)
                    }
                }
            }
        }
    }
}

struct SiderBarView_Previews: PreviewProvider {
    @State static var selectedSidebarItem: SidebarItem? = SidebarItem.all
    @StateObject static var recipeBox = RecipeBox(recipes: load("recipeData.json"))
    static var previews: some View {
        SiderBarView(selection: $selectedSidebarItem,recipeBox:recipeBox)
    }
}
