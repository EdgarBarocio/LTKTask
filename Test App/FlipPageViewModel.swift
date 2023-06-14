//
//  FlipPageViewModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

class FlipPageViewModel {
    
    private var serviceCalls = ServiceCalls()
    
    func fetchLTKData(serviceURL: String) {
        
        guard let url = URL(string: serviceURL) else { return }
        serviceCalls.getLTKData(url: url){ [weak self] data in
            guard let self = self else { return }
            
            self.parseData(data: data)
        }
    }
    
    private func parseData(data:Data) {
        var responseDictionary: [String: Any]?
        
        // Used JSONSerialization instead of JSONDecoder because I could not get it to decode the nested JSONs
        do {
            responseDictionary = try JSONSerialization.jsonObject(with: data, options:[]) as? [String: Any] ?? Dictionary()
        } catch {
            print(error.localizedDescription)
        }
        
        let ltksArray:[Dictionary<String, Any>] = responseDictionary?["ltks"] as? [Dictionary<String, Any>] ?? Array()
        let profiles: [Dictionary<String, Any>] = responseDictionary?["profiles"] as? [Dictionary<String,Any>] ?? Array()
        let products:[Dictionary<String, Any>] = responseDictionary?["products"] as? [Dictionary<String,Any>] ?? Array()
        

        var profilesArray:[ProfileModel] = Array()
        var imagesArray:[ImagesModel] = Array()
        var productsArray:[ProductModel] = Array()
        
        for object in ltksArray {
            let imageModel = ImagesModel(heroImage: object["hero_image"] as? String ?? "",
                                         profileID: object["profile_id"] as? String ?? "",
                                         productIDs: object["product_ids"] as? [String] ?? Array())
            imagesArray.append(imageModel)
        }
        
        for object in profiles {
            let profileModel = ProfileModel(profileID: object["id"] as? String ?? "",
                                            picture: URL(string: object["avatar_url"] as? String ?? ""))
                                     
            profilesArray.append(profileModel)
        }
        
        for object in products {
            let productModel = ProductModel(id: object["id"] as? String ?? "",
                                            imageURL: object["image_url"] as? String ?? "",
                                            hyperlink: object["hyperlink"] as? String ?? "")
            
            productsArray.append(productModel)
        }
        print(imagesArray)
        print(profilesArray)
        print(productsArray)
    }
}
