//
//  AddContactViewController.swift
//  CaleIOSResume
//
//  Created by Cale Switzer on 2/9/19.
//  Copyright © 2019 cale. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitButton(_ sender: AnyObject) {
        print(nameField.text)
        performSegue(withIdentifier: "returnToTrailSafe", sender: nil)
    }

}
