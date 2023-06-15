//
//  LTKObjectParser.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

class LTKObjectParser {
    
    private var serviceCalls = ServiceCalls()
    private let imageCache = NSCache<NSString, NSData>()
    
    private var profilePictureData: String?
    private var productImagesData: [String]? = Array()
    private var heroImageData: String?
    private var hyperLink: [String]? = Array()
    
    public var storeFrontArray:[StoreFront] = Array()
    
    
    func createStorefrontData(data: BaseDataModel) {
        let ltks:[ImagesModel] = data.ltks
        let profiles:[ProfileModel] = data.profiles
        let products:[ProductModel] = data.products
        
        for ltk in ltks {
        
            let profile = ltk.profileID
            
            if let profileURL = profiles.first(where: {$0.profileID == profile}) {
                self.profilePictureData = profileURL.picture
            }
            
            let productIDs = ltk.productIDs
            for productID in productIDs {
                if let productURL = products.first(where: {$0.id == productID}) {
                    self.productImagesData?.append(productURL.imageURL)
                    self.hyperLink?.append(productURL.hyperlink)
                }
            }
            
            self.heroImageData = ltk.heroImage
            
            let storeFront = StoreFront(profilePictureData: self.profilePictureData ?? "",
                                        productImagesData: self.productImagesData ?? [""],
                                        heroImageData: self.heroImageData ?? "",
                                        hyperLink: self.hyperLink ?? [""])
            
            storeFrontArray.append(storeFront)
        }
        
        
        let encoder = JSONEncoder()
        if let encodedObject = try? encoder.encode(storeFrontArray) {
            UserDefaults.standard.set(encodedObject, forKey: "storefront")
        }
    }
}
