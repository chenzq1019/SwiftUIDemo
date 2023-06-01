//
//  ContentView.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList().environmentObject(ModelData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
