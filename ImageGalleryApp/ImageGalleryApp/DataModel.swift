//
//  DataModel.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import Foundation
import UIKit
import SwiftUI

class DataModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    init() {
        if let documentDirectory = FileManager.default.documentDirectory {
            let urls = FileManager.default.getContentsOfDirectory(documentDirectory).filter { $0.isImage }
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
        
        if let urls = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil) {
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
    }
    
    //Adds an item to the data collection
    func addItem(_ item: Item){
        items.insert(item, at: items.endIndex)
    }
    
    //Remove
    func removeItem(_ item: Item){
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            FileManager.default.removeItemFromDocumentDirectory(url: item.url)
        }
    }
    
}

extension URL {
    var isImage: Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]
        return imageExtensions.contains(self.pathExtension)
    }
}
