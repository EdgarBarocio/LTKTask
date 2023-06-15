//
//  ProfileModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct ProfileModel: Codable {
    var profileID: String
    var picture: String
    
    enum CodingKeys: String, CodingKey {
        case profileID = "avatar_url"
        case picture = "id"
    }
}
