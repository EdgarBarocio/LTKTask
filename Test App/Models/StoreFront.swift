//
//  StoreFront.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct StoreFront: Codable {
    var profilePictureData: String
    var productImagesData: [String]
    var heroImageData: String
    var hyperLink: [String]
    
    init(profilePictureData: String, productImagesData: [String], heroImageData: String, hyperLink: [String]) {
        self.profilePictureData = profilePictureData
        self.productImagesData = productImagesData
        self.heroImageData = heroImageData
        self.hyperLink = hyperLink
    }
}
