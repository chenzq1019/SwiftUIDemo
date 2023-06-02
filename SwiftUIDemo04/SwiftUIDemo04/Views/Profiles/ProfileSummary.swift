//
//  ProfileSummary.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/6/2.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelDate: ModelData
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .font(.title).bold()
                Text("Notifications: \(profile.prefersNotifications ? "On" :"Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date:") + Text(profile.goalDate,style: .date)
                Divider()
                VStack(alignment: .leading){
                    Text("Completed Badges").font(.headline)
                    ScrollView(.horizontal){
                        HStack(){
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }.padding(.bottom)
                    }
                }
                Divider()
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelDate.hikes[0])
                }
                
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
