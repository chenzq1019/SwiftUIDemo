//
//  DetailView.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct DetailView: View {
    @State var item: Item
    var body: some View {
        VStack{
            AsyncImage(url: item.url){ image in
                image.resizable()
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    @EnvironmentObject var dataMode : DataModel
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mushy1", withExtension: "jpg") {
            DetailView(item: Item(url: url))
        }
    }
}
