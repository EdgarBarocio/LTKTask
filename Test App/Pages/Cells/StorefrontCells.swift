//
//  StorefrontCells.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation
import UIKit

class StorefrontCells: UICollectionViewCell {
    
    @IBOutlet weak var HeroImage: UIImageView!
    public var imageURL: String?
    private let worker = StorefrontCellsWorker()
    weak var delegate: (ImageDataParsing)?
   
    public func updateImage() {
        worker.delegate = self
        worker.fetchImage(imageURL: self.imageURL ?? "")
    }
}

extension StorefrontCells: ImageDataParsing {
    func returnImageData(imageData: Data) {
        let image = UIImage(data: imageData)
        HeroImage?.image = image
    }
}


