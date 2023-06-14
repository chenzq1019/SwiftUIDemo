//
//  ModalDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct ModalDemo: View {
    var body: some View {
        VStack{
            Button {
                
            } label: {
                Text("Modal view")
                    .bold()
                    .font(.system(.largeTitle,design: .serif))
            }

        }
    }
}

struct ModalDemo_Previews: PreviewProvider {
    static var previews: some View {
        ModalDemo()
    }
}
