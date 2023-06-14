//
//  EventTile.swift
//  SwiftUIDemo07
//
//  Created by 陈竹青 on 2023/6/13.
//

import SwiftUI

struct Event{
    let title: String
    let date: Date
    let location: String
    let symbol: String
}

struct EventTile: View {
    let event: Event
    let stripeHeight = 15.0
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Image(systemName: event.symbol)
                .resizable()
                .frame(width: 30 ,height: 30)
            VStack(alignment: .leading){
                Text(event.title).font(.system(size: 30))
                Text(event.date,format:Date.FormatStyle().day(.defaultDigits).month(.wide))
                Text(event.location)
            }
        }
        .padding()
        .padding(.top,stripeHeight)
        .background {
            ZStack(alignment: .top){
                Rectangle()
                    .opacity(0.3)
                Rectangle()
                    .frame(maxHeight: stripeHeight)
            }.foregroundColor(.teal)
        }
        .cornerRadius(10)
    }
}

struct EventTile_Previews: PreviewProvider {
    
    static let event1: Event = Event(title: "Buy Daisies", date: .now, location: "Flower Shop", symbol: "gift")
    static var previews: some View {
        EventTile(event: event1)
        
    }
}
