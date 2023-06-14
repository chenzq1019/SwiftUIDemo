//
//  ImageDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct ImageDemo: View {
    let imageUrl: String = "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00294-1641.jpg"
    var body: some View {
        VStack{
            //加载本地图片
            Image("star").resizable()
                .frame(width: 50,height: 50)
            //加载系统图片
            Image(systemName: "star").resizable()
                .frame(width: 100,height: 100)
            //加载网络图片
            AsyncImage(url: URL(string: imageUrl)){image in
                image.resizable()
            } placeholder: {//设置默认图片
                Image("star").resizable()
            }.frame(width: 100,height: 100)
           
        }
    }
}

struct ImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemo()
    }
}
