//
//  SwiftUIDemo04App.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

@main
struct SwiftUIDemo04App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ModelData())
        }
    }
}
