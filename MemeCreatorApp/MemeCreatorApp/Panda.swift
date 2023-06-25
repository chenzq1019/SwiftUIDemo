//
//  Panda.swift
//  MemeCreatorApp
//
//  Created by 陈竹青 on 2023/6/16.
//

import Foundation
import SwiftUI


struct Panda: Codable {
    var description: String
    var imageUrl: URL?
    static let defulatPanda = Panda(description: "Cute Panda",
    imageUrl: URL(string: "https://assets.devpubs.apple.com/playgrounds/_assets/pandas/pandaBuggingOut.jpg"))
}

struct PandCollection: Codable {
    var sample: [Panda]
}
