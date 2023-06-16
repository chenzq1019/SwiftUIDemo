//
//  ContentView.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            GridView()
        }
        .navigationViewStyle(.stack)
        .environmentObject(DataModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
