//
//  ProfileHost.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/6/2.
//

import SwiftUI

struct ProfileHost: View {
    //Add an Environment view property that keys off of the environment’s \.editMode.
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    var body: some View {
//        Text("Profile for: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel",role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        
                
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
