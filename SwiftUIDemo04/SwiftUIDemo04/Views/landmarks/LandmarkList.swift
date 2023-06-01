//
//  LandmarkList.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    //定义一个计算属性来过滤数据
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmak in
            (!showFavoriteOnly || landmak.isFavorite)
        }
    }
    
    var body: some View {

        NavigationView(content: {
            List{
                Toggle(isOn: $showFavoriteOnly) {
                                    Text("Favorites only")
                                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        })
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
