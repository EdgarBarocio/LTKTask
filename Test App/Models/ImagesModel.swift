//
//  ImagesModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct ImagesModel: Codable {
    var heroImage: String
    var profileID: String
    var productIDs: [String]
    
    enum CodingKeys: String, CodingKey {
        case heroImage = "hero_image"
        case profileID = "profile_id"
        case productIDs = "product_ids"
    }
//    init(heroImage: String, profileID: String, productIDs: [String]) {
//        self.heroImage = heroImage
//        self.profileID = profileID
//        self.productIDs = productIDs
//    }
}
