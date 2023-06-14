//
//  ViewController.swift
//  Test App
//
//  Created by Simon Fortelny on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    let serviceCalls = ServiceCalls()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let url = URL(string: Constants.serviceURL) else { return }
        serviceCalls.getLTKData(url: url){ [weak self] data in
            guard let self = self else { return }
            
            print(data)
        }
    }


    private func 
}

