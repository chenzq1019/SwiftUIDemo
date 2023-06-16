//
//  LayoutouContainerView.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct LayoutouContainerView: View {
    var body: some View {
        VStack {
            ZStack{
                Rectangle().foregroundColor(.red)
                Circle().foregroundColor(.blue)
            }
            ZStack{
                Rectangle().foregroundColor(.blue)
                HStack{
                    Circle().foregroundColor(.red)
                    Circle().foregroundColor(.orange)
                }
            }
        }
    }
}

struct LayoutouContainerView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutouContainerView()
    }
}
