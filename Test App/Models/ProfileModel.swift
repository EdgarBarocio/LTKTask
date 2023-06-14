//
//  ProfileModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct ProfileModel {
    var profileID: String
    var picture: URL?
    
    init(profileID: String, picture: URL?) {
        self.profileID = profileID
        self.picture = picture
    }
}
