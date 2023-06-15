//
//  StorefrontCellsWorker.swift
//  Test App
//
//  Created by Edgar Barocio on 6/15/23.
//

import Foundation

class StorefrontCellsWorker {
    weak var delegate: (ImageDataParsing)?
    private let imageCache = NSCache<NSString, NSData>()
    private var serviceCalls = ServiceCalls()
    
    func fetchImage(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        if let cachedImageData = imageCache.object(forKey: imageURL as NSString) {
            delegate?.returnImageData(imageData: cachedImageData as Data)
        }
        
        serviceCalls.getRAWdata(url: url){ [weak self] data in
            guard let self = self else { return }
            
            self.imageCache.setObject(data as NSData, forKey: imageURL as NSString)
            
            self.delegate?.returnImageData(imageData: data)
        }
    }
}
