//
//  BaseDataModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

struct BaseDataModel: Codable {
    var ltks: [ImagesModel]
    var profiles: [ProfileModel]
    //var meta:Meta
    var products:[ProductModel]
}

struct Meta: Codable {
    var ltkId: String
}
