//
//  addTeacherViewController.swift
//  tutor
//
//  Created by kuet on 29/11/18.
//  Copyright © 2018 KUET CSE 2k15. All rights reserved.
//

import UIKit
import Firebase

class addTeacherViewController: UIViewController {

    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var uAddress: UITextField!
    @IBOutlet weak var uEmail: UITextField!
    @IBOutlet weak var uPhone: UITextField!
    @IBOutlet weak var uEducation: UITextField!
    @IBOutlet weak var uSubject: UITextField!
    @IBOutlet weak var uFee: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    var username:String = ""
    
    @IBAction func submitButton(_ sender: Any) {
        
        print("key = b")
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
        
        var newRef: DatabaseReference!
        newRef = Database.database().reference().child("Teacher").childByAutoId()
        
        //newRef = ref.child("Teacher").childByAutoId()
        
        //        let subj=["name":"Englsh",
        //                  "fee":"3000"]
        
        //        let data=["name":"Aksh",
        //                  "address":"kuet",
        //                  "phone":"01928383",
        //                  "institute":"kuet",
        //                  "education":"undergrad",
        //                  "subject":"\(subj)"]
        
//        newRef.setValue([
//            "Profile": [
//                "name":uname.text,
//                "address":uAddress.text,
//                "phone":uEmail.text,
//                "institute":uPhone.text,
//                "education":uEducation.text,
//            ],
//            "Subject":[
//                "name": uSubject.text,
//                "fee": uFee.text
//            ]
//        ]) { (error, ref) in
//            if error != nil {
//                print(error?.localizedDescription ?? "Failed to update value")
//            } else {
//                print("Success update newValue to database")
//            }
//        }
        
        newRef.setValue([
                "name":uname.text,
                "address":uAddress.text,
                "phone":uEmail.text,
                "institute":uPhone.text,
                "education":uEducation.text,
                "subjects":uSubject.text,
                "fee":uFee.text
        ]) { (error, ref) in
            if error != nil {
                print(error?.localizedDescription ?? "Failed to update value")
            } else {
                print("Success update newValue to database")
            }
        }
        
        
//        ref.setValue("Hello", withCompletionBlock: { (error, snapshot) in
//            if error != nil {
//                print("oops, an error")
//            } else {
//                print("completed")
//            }
//        })
        
        //successful
//        let myalert = UIAlertController(title: "Alert", message: "RegistrationSuccessful", preferredStyle: UIAlertControllerStyle.alert)
//        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {action in self.dismiss(animated: true, completion: nil)})
//
//        myalert.addAction(okAction)
//        self.present(myalert, animated: true,
//                     completion: nil)
        
        
    }
    
    func displayAlertMessage(userMeassage: String)
    {
        let myalert = UIAlertController(title: "Alert", message: userMeassage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myalert.addAction(okAction)
        self.present(myalert, animated: true,
                     completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel?.text = username
        //newRef.child("Subject").child("Aksh").setValue(["username": "Rifat"])
        //reference.updateChildren(taskMap);
        //newRef.setValue(data)
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        //ref.child("Teacher").child("Aksh").setValue(["username": "Rifat"])
        
        //let userID = Auth.auth().currentUser?.uid
        ref.child("Teacher").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            //let value = snapshot.value as? [String:Any]
            //let username = value?["username"] as? String ?? ""
            //let user = User(username: username)
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
            }
            
            DispatchQueue.main.async{
                //self.demoTexts.text = "\(value)"
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
