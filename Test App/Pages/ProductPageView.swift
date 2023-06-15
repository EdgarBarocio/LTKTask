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
        productPageViewModel.delegate = self
        productPageViewModel.fetchImage(imageURL: self.imageURL ?? "")
    }
}

extension ProductPageView: ImageDataParsing {
    func returnImageData(imageData: Data) {
        let image = UIImage(data: imageData)
        HeroImage?.image = image
    }
}

