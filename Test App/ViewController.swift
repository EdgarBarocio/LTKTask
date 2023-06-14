//
//  ViewController.swift
//  Test App
//
//  Created by Simon Fortelny on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    let flipPageViewModel = FlipPageViewModel()
    var productPages = [ProductPageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        flipPageViewModel.fetchLTKData(serviceURL: Constants.serviceURL)
    }


    //private func 
}

