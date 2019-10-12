//
//  SSViewController.swift
//  tutor
//
//  Created by kuet on 2/12/18.
//  Copyright © 2018 KUET CSE 2k15. All rights reserved.
//

import UIKit

class SSViewController: UIViewController {
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var subject: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SearchStuViewController
        {
            let vc = segue.destination as? SearchStuViewController
            vc?.username = address.text!+"spit"+subject.text!
        }
    }

}
