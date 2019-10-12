//
//  addStudentViewController.swift
//  tutor
//
//  Created by kuet on 29/11/18.
//  Copyright © 2018 KUET CSE 2k15. All rights reserved.
//

import UIKit
import Firebase

class addStudentViewController: UIViewController {

    @IBOutlet weak var sNmae: UITextField!
    @IBOutlet weak var sAddress: UITextField!
    @IBOutlet weak var sEmail: UITextField!
    @IBOutlet weak var sPhone: UITextField!
    @IBOutlet weak var sEducation: UITextField!
    @IBOutlet weak var sSubject: UITextField!
    @IBOutlet weak var sFee: UITextField!
    @IBAction func SubmitButton(_ sender: Any) {
        print("key = student SubmitButton")
        
        var newRef: DatabaseReference!
        newRef = Database.database().reference().child("Student").childByAutoId()
        
        newRef.setValue([
            "Profile": [
                "name":sNmae.text,
                "address":sAddress.text,
                "phone":sEmail.text,
                "institute":sPhone.text,
                "education":sEducation.text,
            ],
            "Subject":[
                "name": sSubject.text,
                "fee": sFee.text
            ]
        ]) { (error, ref) in
            if error != nil {
                print(error?.localizedDescription ?? "Failed to update value")
            } else {
                print("Success student update newValue to database")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
