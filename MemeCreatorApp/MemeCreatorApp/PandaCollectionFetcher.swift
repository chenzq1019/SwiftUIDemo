//
//  PandaCollectionFetcher.swift
//  MemeCreatorApp
//
//  Created by 陈竹青 on 2023/6/16.
//

import Foundation
import SwiftUI

class PandaCollectionFetcher: ObservableObject {
    @Published var imageData = PandCollection(sample: [Panda.defulatPanda])
    @Published var currentPanda = Panda.defulatPanda
    
    let urString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badReqeust
        case badJSON
    }
    
    func fetchData() async throws -> Void {
        guard let url = URL(string: urString) else { return }
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badReqeust }
        Task { @MainActor in
            imageData = try JSONDecoder().decode(PandCollection.self, from: data)
        }
    }
    
}
