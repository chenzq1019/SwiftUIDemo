//
//  LoadableImage.swift
//  MemeCreatorApp
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct LoadableImage: View {
    var imageMetadata: Panda
    
    var body: some View {
        AsyncImage(url: imageMetadata.imageUrl){ phase in
            if let image = phase.image{
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }else if (phase.error != nil){
                VStack{
                    Image("pandaplaceholder").resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("The panda were all busy").font(.title2)
                    Text("Please try agin").font(.title3)
                }
            }else{
                ProgressView()
            }
        }
    }
}

struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage(imageMetadata: Panda.defulatPanda)
    }
}
