//
//  ProductPageView.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation
import UIKit

class ProductPageView: UIViewController {

    let productPageViewModel = ProductPageViewModel()
    var imageURL:String?
    var index: Int = 0
    
    @IBOutlet weak var HeroImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeroImage.isUserInteractionEnabled = true
        productPageViewModel.delegate = self
        productPageViewModel.fetchImage(imageURL: self.imageURL ?? "")
    }
    
    
    // MARK: - Actions

    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        let storefront = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "collectionView") as! StorefrontCollectionView
        
        if let encodedObject = UserDefaults.standard.data(forKey: "storefront") {
            let decoder = JSONDecoder()
            if let decodedObject = try? decoder.decode([StoreFront].self, from: encodedObject) {
                let front = decodedObject[self.index] as StoreFront
                
                storefront.profileURL = front.profilePictureData
                storefront.products = front.productImagesData
                storefront.hyperLink = front.hyperLink
                storefront.heroImage = front.heroImageData
            }
        }

        self.navigationController?.pushViewController(storefront, animated: true)
    }
}

extension ProductPageView: ImageDataParsing {
    func returnImageData(imageData: Data) {
        let image = UIImage(data: imageData)
        HeroImage?.image = image
    }
}

