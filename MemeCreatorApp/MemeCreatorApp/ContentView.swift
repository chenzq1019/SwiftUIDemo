//
//  ContentView.swift
//  MemeCreatorApp
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MemeCreator()
            .environmentObject(PandaCollectionFetcher())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
