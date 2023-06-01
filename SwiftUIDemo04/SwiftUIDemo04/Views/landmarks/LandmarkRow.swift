//
//  LandmarkRow.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50,height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
                .previewLayout(.fixed(width: 325, height: 70))
            LandmarkRow(landmark: landmarks[1])
                .previewLayout(.fixed(width: 325, height: 70))
        }
    
    }
}
