//
//  MoodViewFull.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct MoodViewFull: View {
    @Binding var value: String
    private let emojis = ["😢", "😴", "😁", "😡", "😐"]
    var body: some View {
        VStack {
            Text("What's your mood?").foregroundColor(Color.brown)
            HStack{
                ForEach(emojis,id: \.self) { emoji in
                    VStack(spacing: 5){
                        Text(emoji).font(.title)
                        Image(systemName: value == emoji ? "circle.fill" : "circle")
                            .font(.system(size: 16))
                            .foregroundColor(.brown)
                    }
                }
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.black)
        }
        .cornerRadius(10)
    }
    

}

struct MoodViewFull_Previews: PreviewProvider {
    @State static var emoji =  "😢"
    static var previews: some View {
        MoodViewFull(value: $emoji)
    }
}
