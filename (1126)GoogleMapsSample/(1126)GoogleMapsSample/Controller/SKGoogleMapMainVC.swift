//
//  ViewController.swift
//  (1126)GoogleMapsSample
//
//  Created by Samuel K on 2017. 11. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker
import Firebase
import FirebaseStorage
import FirebaseDatabase

class SKGoogleMapMainVC: UIViewController, GMSPlacePickerViewControllerDelegate, UINavigationControllerDelegate {

    
    //특정 영역에서 구글맵을 사용하기 위해선, 특정 클래스를 상속 받는 IBOutlet을 선언하여 주어야 한다.
    
    
    @IBOutlet weak var latiTF: UITextField!
    @IBOutlet weak var longiTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var CustomMap: GMSMapView!
    var zoom:Float = 15.0
    
    var config:GMSPlacePickerConfig?
    var placePicker:GMSPlacePickerViewController?
    
    
    //var samplePosition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSomeWhere(lati: 37.515, longi: 127.019, placeName: "Fast Campus!")
        
        reloadPoint()
        self.navigationController?.navigationBar.backgroundColor = .yellow
        config = GMSPlacePickerConfig(viewport: nil)
        placePicker = GMSPlacePickerViewController(config: config!)
    
        placePicker?.delegate = self
        
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        // 현재 보여지는 Area기준, 사각 끝점의 위도 경도의 데이터를 확인 하는 프로퍼티
        let projection = CustomMap.projection.visibleRegion()
        
//        let topLeftCorner:CLLocationCoordinate2D = projection.farLeft
//        let topRightCorner:CLLocationCoordinate2D = projection.farRight
//        let bottomLeftCorner:CLLocationCoordinate2D = projection.nearLeft
//        let bottomRightCorner:CLLocationCoordinate2D = projection.nearRight
        
//        print("Top1 : ", topLeftCorner)
//        print("Top2 : ", topRightCorner)
//        print("Bottom1 : ", bottomLeftCorner)
//        print("Bottom2 : ", bottomRightCorner)
    }
    
    
    

    
    func reloadPoint(){
        
        let loadPosition = PositionData.main.positionDatas
        //print("엥?", loadPosition)
        
        for data in loadPosition {
            
            let somewhere = "여기는 어딘가?"
            showSomeWhere(lati: data.lati!, longi: data.longi!, placeName: somewhere)
            
        }
    }
    
    //구글맵을 이용한, 특정 위치를 불러오는 메서드를 구현한다.
    func showSomeWhere(lati: Double, longi:Double, placeName:String){
        
        // 위도, 경도를 지정하여 주는 프로퍼티
        let camera = GMSCameraPosition.camera(withLatitude: lati, longitude: longi, zoom: zoom)
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
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        
        viewController.dismiss(animated: true, completion: nil)
        
        
        
        print("장소명 : ", place.name)
        print("주소명 : ", place.formattedAddress)
        print("어트리뷰션 : ", place.attributions)
        
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        
        viewController.dismiss(animated: true, completion: nil)
        print("장소가 선택되지 않았습니다.")
        
    }
    
    //특정 장소를 표기하고 저장하는 곳을 검색한다.
    @IBAction func pickPlaceBtn(_ sender: Any) {
        
        present(placePicker!, animated: true, completion: nil)
        
        placePicker?.navigationController?.delegate = self
        placePicker?.navigationController?.navigationBar.barTintColor = UIColor.yellow
        placePicker?.navigationController?.navigationBar.backgroundColor = UIColor.yellow
        
        
        
    }
    
    // 맵의 현재 Zoom상태를 조절하는 메서드 (확대 / 축소 )
    @IBAction func SizeUp(_ sender: UIButton) {
        zoom += 1
        CustomMap.animate(toZoom: zoom)
    }
    
    
    @IBAction func SizeDown(_ sender: Any) {
        zoom -= 1
        CustomMap.animate(toZoom: zoom)
    }
    
    @IBAction func createNewLocation(_ sender: Any) {
        
        guard let latiNum = latiTF.text else { return }
        guard let longiNum = longiTF.text else { return }
        
        showSomeWhere(lati: Double(latiNum)!, longi: Double(longiNum)!, placeName: titleTF.text!)
        
    }
    
    
}

