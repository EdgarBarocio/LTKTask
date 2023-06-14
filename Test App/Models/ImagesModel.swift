//
//  ImagesModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct ImagesModel {
    var heroImage: String
    var profileID: String
    var productIDs: [String]
    
    init(heroImage: String, profileID: String, productIDs: [String]) {
        self.heroImage = heroImage
        self.profileID = profileID
        self.productIDs = productIDs
    }
}
