//
//  Item.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct Item : Identifiable{
    var id = UUID()
    var url: URL
}

extension Item: Equatable{
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.url == rhs.url
    }
}
