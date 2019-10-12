//
//  ViewController.swift
//  tutor
//
//  Created by kuet on 26/11/18.
//  Copyright © 2018 KUET CSE 2k15. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var demoTexts: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        var ref: DatabaseReference!
//        
//        ref = Database.database().reference()
//        //ref.child("Teacher").child("Aksh").setValue(["username": "Rifat"])
//
//        let newRef = ref.child("Teacher").childByAutoId()
//
//        let subj=["name":"Englsh",
//                  "fee":"3000"]
//
////        let data=["name":"Aksh",
////                  "address":"kuet",
////                  "phone":"01928383",
////                  "institute":"kuet",
////                  "education":"undergrad",
////                  "subject":"\(subj)"]
//
//        newRef.setValue([
//            "Profile": [
//                "name":"Aksh",
//                "address":"kuet",
//                "phone":"01928383",
//                "institute":"kuet",
//                "education":"undergrad",
//            ],
//            "Subject":[
//                "isActive": "none"
//            ]
//            ])
//
//        //reference.updateChildren(taskMap);
//        //newRef.setValue(data)
//
//
//
//        //let userID = Auth.auth().currentUser?.uid
//        ref.child("Teacher").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? [String:Any]
//            //let username = value?["username"] as? String ?? ""
//            //let user = User(username: username)
//
//            for child in snapshot.children {
//                let snap = child as! DataSnapshot
//                let key = snap.key
//                let value = snap.value
//                print("key = \(key)  value = \(value!)")
//            }
//
//            DispatchQueue.main.async{
//                self.demoTexts.text = "\(value)"
//            }
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is addTeacherViewController
        {
            let vc = segue.destination as? addTeacherViewController
            vc?.username = "Arthur Dent"
        }
    }


}

