//
//  LandmarkDetail.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    //计算属性
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex { temp in
            temp.id == landmark.id
        }!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
                    .ignoresSafeArea(edges:.top)
                CircleImage(image: landmark.image).offset(y:-130).padding(.bottom,-130)
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name).font(.largeTitle).foregroundColor(.black)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("About \(landmark.name)").font(.title2)
                    Text(landmark.description)
                }.padding()
            }
        }.navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[2])
    }
}
