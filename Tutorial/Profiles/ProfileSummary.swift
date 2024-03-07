//
//  ProfileSummary.swift
//  Tutorial
//
//  Created by Josafath Sosa Jimenez on 06/03/24.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack{
                    Text("Completed Badges").font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            HikeBadge(name: "First hike")
                            HikeBadge(name: "Earth Day ")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth hike ")
                                .hueRotation(Angle(degrees: 45))
                                .grayscale(0.5)
                        }
                        .padding(.bottom)
                    }
                }
                VStack(alignment: .leading){
                    Text("Recent Hikes").font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(ModelData())
    }
}
