//
//  ProductModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct ProductModel: Codable {
    var id: String
    var imageURL: String
    var hyperlink: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "image_url"
        case hyperlink = "hyperlink"
    }
}
