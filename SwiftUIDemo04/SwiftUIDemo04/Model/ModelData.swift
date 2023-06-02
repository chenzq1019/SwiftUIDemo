//
//  ModelData.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
    //Add the @Published attribute to the landmarks array.
    @Published var landmarks: [Landmark] =  load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    @Published var profile = Profile.default
    
    var features: [Landmark]{
        landmarks.filter { landmark in
            landmark.isFeatured
        }
    }
    
    //将数组转化成另一个数组，内容为字典类型
    var categories: [String:[Landmark]]{
        Dictionary(
            grouping: landmarks) { elemnet in
                elemnet.category.rawValue
            }
    }
}

//var landmarks: [Landmark] =  load("landmarkData.json")

func load<T: Decodable>(_ fileName:String) -> T{
    let data : Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find\(fileName) in main bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(fileName)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
