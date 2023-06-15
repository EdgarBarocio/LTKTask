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
        
        self.navigationController?.pushViewController(storefront, animated: true)
    }
}

extension ProductPageView: ImageDataParsing {
    func returnImageData(imageData: Data) {
        let image = UIImage(data: imageData)
        HeroImage?.image = image
    }
}

