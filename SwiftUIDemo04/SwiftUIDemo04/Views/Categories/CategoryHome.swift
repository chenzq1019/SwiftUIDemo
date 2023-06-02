//
//  CategoryHome.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/6/2.
//

import SwiftUI

struct CategoryHome: View {
    @State private var showingProfile: Bool = false
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationView{
            List{
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(),id:\.self){ key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile",systemImage: "person.crop.circle")
                    }

                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost().environmentObject(modelData)
                }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
