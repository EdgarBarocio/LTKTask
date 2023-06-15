//
//  FlipPageViewModel.swift
//  Test App
//
//  Created by Edgar Barocio on 6/14/23.
//

import Foundation

class FlipPageViewModel {
    
    private var serviceCalls = ServiceCalls()
    weak var delegate: (DataParseResultsDelegate)?
    
    func fetchLTKData(serviceURL: String) {
        
        guard let url = URL(string: serviceURL) else { return }
        serviceCalls.getLTKData(url: url){ [weak self] data in
            guard let self = self else { return }
            
            self.parseData(data: data)
        }
    }
    
    private func parseData(data:Data) {
        let decoder = JSONDecoder()
        
        do {
            let decoded = try decoder.decode(BaseDataModel.self, from: data)
            
            delegate?.buildViewControllerPages(dataModel: decoded)
            let parser = LTKObjectParser()
            parser.createStorefrontData(data: decoded)
        } catch {
            print("Failed to decode JSON")
        }
    }
}
