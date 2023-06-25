//
//  GridItemView.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct GridItemView: View {
    let size: Double
    let item: Item
    
    var body: some View {
        ZStack(alignment: .center){
            AsyncImage(url: item.url){ image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mushy1", withExtension: "jpg") {
            GridItemView(size: 50, item: Item(url: url))
        }
       
    }
}
