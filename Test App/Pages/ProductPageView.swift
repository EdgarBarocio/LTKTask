//
//  ProductPageView.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation
import UIKit

class ProductPageView: ViewController {
    
    private let imageCache = NSCache<NSString, NSData>()
    var heroImageURL: String?
    
    @IBOutlet weak var HeroImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    private func configureImage(imageURL: URL) {
//        HeroImage.image = UIImage(data: Data)
//    }
}
