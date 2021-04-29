//
//  ProfileHose.swift
//  Landmarks
//
//  Created by Manuel Casocavallo on 29/04/21.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHose_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
