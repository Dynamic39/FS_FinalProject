//
//  SeleteedViewController.swift
//  (1126)GoogleMapsSample
//
//  Created by Samuel K on 2017. 12. 6..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {

    @IBOutlet weak var placeNameLB: UILabel!
    @IBOutlet weak var addressLB: UILabel!
    
    @IBOutlet weak var selectedimgView1: UIImageView!
    @IBOutlet weak var selectedimgView2: UIImageView!
    @IBOutlet weak var selectedimgView3: UIImageView!
    
    var placeName:String?
    var addressValue:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeNameLB.text = placeName
        addressLB.text = addressValue

        
    }

    

}
