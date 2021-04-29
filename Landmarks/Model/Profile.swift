//
//  Profile.swift
//  Landmarks
//
//  Created by Manuel Casocavallo on 29/04/21.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotification = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default`  = Profile(username: "Manuel")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌸"
        case summer = "☀️"
        case autumn = "🍂"
        case winter = "⛄️"
        
        var id: String { self.rawValue }
    }
    
}
