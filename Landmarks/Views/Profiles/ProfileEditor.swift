//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Manuel Casocavallo on 30/04/21.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                    .padding(.horizontal)
                TextField("Username", text: $profile.username)
            }
            .padding(.vertical)
            
            Toggle(isOn: $profile.prefersNotification) {
                Text("Enable Notifications")
                    .bold()
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.vertical)
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                    .bold()
            }
            .padding(.vertical)
            
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
