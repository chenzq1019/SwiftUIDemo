//
//  IfElseTrain.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct IfElseTrain: View {
    var isLongTrain: Bool
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "train.side.rear.car")
//                if isLongTrain{
                Image(systemName: "train.side.middle.car").opacity(isLongTrain ? 1:0)
//                }
                Image(systemName: "train.side.front.car")
            }
            Divider()
        }
    }
}

struct IfElseTrain_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            IfElseTrain(isLongTrain: true)
            IfElseTrain(isLongTrain: false)
        }
       
    }
}
