//
//  FirebaseSampleVC.swift
//  (1126)GoogleMapsSample
//
//  Created by Samuel K on 2017. 11. 29..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase


var ref: DatabaseReference!

class FirebaseSampleVC: UIViewController {
    
    @IBOutlet weak var lati: UITextField!
    @IBOutlet weak var longi: UITextField!
    
    var latiData:Double?
    var longiData:Double?
    
    var user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //데이터 베이스에서 읽거나 쓰기 위하여 기초작업을 진행한다.
        
        ref = Database.database().reference()
        
        
        
        
        
        //쓰기 작업을 진행한다.
    //ref.child("users").child((user?.uid)!).setValue(["lati":latiData,"longi":longiData])

    }
    
    
    @IBAction func inputSample(_ sender: Any) {
        
        self.latiData = Double(lati.text!)
        self.longiData = Double(longi.text!)
        
        let value = ["lati":latiData, "longi":longiData]
        
        ref.child("latiAndLongi").childByAutoId().setValue(value)
        print("에러처리 : ", ref.debugDescription)
        
    }
    


}

struct Position {
    
    let lati:Double?
    let longi:Double?
    
    
    init?(Data: [String:Any]) {
        
        guard let lati = Data["lati"] as? Double else { return nil }
        self.lati = lati
        guard let longi = Data["longi"] as? Double else { return nil }
        self.longi = longi

        
    }
}

class PositionData {
    
    static var main = PositionData()
    
    var positionData:[Position] = []

    init() {
        loadData()
    }
    
    
    func loadData() {
        
        ref = Database.database().reference()
        
        ref.child("latiAndLongi").observeSingleEvent(of: .value) { (snapshot) in
            
            if let dataBase = snapshot.value as? [String:Any] {
                
                for each in dataBase {
                    let autoID = each.key
                    //print(autoID)
                    
                    ref.child("latiAndLongi").child(autoID).observeSingleEvent(of: .value, with: { (snap) in
                        
                        let datas = Position.init(Data: snap.value as! [String : Any])
                        
                        self.positionData.append(datas!)
                        
                        print("어디서 발생함? : ", self.positionData)
                    })
                    
                }
                
                UserDefaults.standard.set(self.positionData, forKey: "Yame")
                
            }
        }
        
    }
    
    
    
    
}
