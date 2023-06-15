//
//  ViewController.swift
//  Test App
//
//  Created by Simon Fortelny on 3/4/22.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    let flipPageViewModel = FlipPageViewModel()
    
    var productPages:[ProductPageView] = [ProductPageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        flipPageViewModel.delegate = self
        flipPageViewModel.fetchLTKData(serviceURL: Constants.serviceURL)
    }


    //MARK: Datasource and Delegate for page view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = productPages.firstIndex(of: viewController as! ProductPageView) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return productPages.last
        }
        
        guard productPages.count > previousIndex else {
            return nil
        }
        
        return productPages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = productPages.firstIndex(of: viewController as! ProductPageView) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard productPages.count != nextIndex else {
            return productPages.first
        }
        
        guard productPages.count > nextIndex else {
            return nil
        }
        
        return productPages[nextIndex]
    }
}

extension PageViewController: DataParseResultsDelegate {
    
    func buildViewControllerPages(dataModel: BaseDataModel) {
        for ltk in dataModel.ltks {
            let product = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageView") as! ProductPageView
            product.imageURL = ltk.heroImage
            productPages.append(product)
            
            if let firstViewController = productPages.first {
                setViewControllers([firstViewController],
                                   direction: .forward,
                                   animated: true,
                                   completion: nil)
            }
        }
    }
    
    
}

