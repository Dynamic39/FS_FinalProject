//
//  ViewController.swift
//  (1126)GoogleMapsSample
//
//  Created by Samuel K on 2017. 11. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    
    //특정 영역에서 구글맵을 사용하기 위해선, 특정 클래스를 상속 받는 IBOutlet을 선언하여 주어야 한다.
    
    
    @IBOutlet weak var latiTF: UITextField!
    @IBOutlet weak var longiTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var CustomMap: GMSMapView!
    
    //var samplePosition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSomeWhere(lati: 37.515, longi: 127.019, placeName: "Fast Campus!")
    }
    

    //구글맵을 이용한, 특정 위치를 불러오는 메서드를 구현한다.
    func showSomeWhere(lati: Double, longi:Double, placeName:String){
        
        // 위도, 경도를 지정하여 주는 프로퍼티
        let camera = GMSCameraPosition.camera(withLatitude: lati, longitude: longi, zoom: 15)
        // 선언된 IBOulet의 위치를 지정해준다.
        self.CustomMap.camera = camera
        
        //구글 마커 기능을 이용하여, Anotation을 찍어주는 기능을 구현한다.
        let marker = GMSMarker()
        marker.map = CustomMap
        marker.position = camera.target
        marker.snippet = placeName
        //? marker.appearAnimation = GMSMarkerAnimation.pop
        
        CustomMap.settings.myLocationButton = true
        CustomMap.isMyLocationEnabled = true
        
        
    }
    
    
    @IBAction func createNewLocation(_ sender: Any) {
        
        guard let latiNum = latiTF.text else { return }
        guard let longiNum = longiTF.text else { return }
        
        
        
        showSomeWhere(lati: Double(latiNum)!, longi: Double(longiNum)!, placeName: titleTF.text!)
        
    }
    

}

