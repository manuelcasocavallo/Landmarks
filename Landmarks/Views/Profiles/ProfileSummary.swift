//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Manuel Casocavallo on 29/04/21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotification ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 170))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 250))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                    
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile(username: "Test"))
            .environmentObject(ModelData())
    }
}
