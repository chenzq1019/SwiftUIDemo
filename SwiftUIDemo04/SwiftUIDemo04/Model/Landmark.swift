//
//  Landmark.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable,Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    
    enum Category: String, CaseIterable, Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    //计算属性
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    //嵌套结构
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
    
}
