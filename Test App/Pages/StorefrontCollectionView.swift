//
//  StorefrontCollectionView.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation
import UIKit

class StorefrontCollectionView: UICollectionViewController {
    
    public var profileURL: String?
    public var products: [String]?
    public var hyperLink: [String]?
    public var heroImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: CollectionView
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return products?.count ?? 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "cell", for: indexPath) as! StorefrontCells
        if indexPath.section == 0 {
            cell.imageURL = profileURL
        } else {
            cell.imageURL = products?[indexPath.row]
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section > 0 {
            guard let url = URL(string: hyperLink?[indexPath.row] ?? "") else { return }
            UIApplication.shared.open(url)
        }
    }
}
