//
//  ProductModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct ProductModel {
    var id: String
    var imageURL: String
    var hyperlink: String
    
    init(id: String, imageURL: String, hyperlink: String) {
        self.id = id
        self.imageURL = imageURL
        self.hyperlink = hyperlink
    }
}
