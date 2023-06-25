//
//  ContentView.swift
//  GestureDemo
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
//                TapView()
//                LongPressView()
//                DragView()
                RotateView()
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
