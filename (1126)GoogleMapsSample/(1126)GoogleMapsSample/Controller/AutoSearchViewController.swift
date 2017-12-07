//
//  AutoSearchViewController.swift
//  (1126)GoogleMapsSample
//
//  Created by Samuel K on 2017. 12. 7..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import GooglePlaces

class AutoSearchViewController: UIViewController {
    
    @IBOutlet weak var placeLB: UILabel!
    @IBOutlet weak var addressLB: UILabel!
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView:UITextView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        searchController?.searchBar.sizeToFit()
        navigationItem.titleView = searchController?.searchBar
        
        definesPresentationContext = true
        
        searchController?.hidesNavigationBarDuringPresentation = false
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue
        
    }
    
    @IBAction func searchForGoogleBtn(_ sender: UIButton) {
        
        
        
        
        
    }
    

}

extension AutoSearchViewController : GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        searchController?.isActive = false
        
        placeLB.text = place.name
        addressLB.text = place.formattedAddress
        
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        
        print("Error : ", error.localizedDescription)
        
    }
    
    
    
    
    
}
