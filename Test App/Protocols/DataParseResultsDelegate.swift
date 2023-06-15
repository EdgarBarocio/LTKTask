//
//  DataParseResultsDelegate.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

protocol DataParseResultsDelegate: AnyObject {
    func buildViewControllerPages(dataModel: BaseDataModel)
}

protocol ImageDataParsing: AnyObject {
    func returnImageData(imageData: Data)
}
