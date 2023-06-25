//
//  DataModel.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import Foundation
import AVFoundation
import SwiftUI
import os.log

final class DataModel: ObservableObject{
//    let camera = Camera()
    let photoCollection = PhotoCollection(smartAlbum: .smartAlbumUserLibrary)
}
