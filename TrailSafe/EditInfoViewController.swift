//
//  EditInfoViewController.swift
//  CaleIOSResume
//
//  Created by Cale Switzer on 2/10/19.
//  Copyright © 2019 cale. All rights reserved.
//

import UIKit

class EditInfoViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var returnField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionField.layer.borderColor = UIColor.lightGray.cgColor
        descriptionField.layer.borderWidth = 0.25;
        descriptionField.layer.cornerRadius = 5.0;
        
        nameField.text = MyCustomTabController.trailName
        locationField.text = MyCustomTabController.trailLocation
        peopleField.text = MyCustomTabController.trailPeople
        returnField.text = MyCustomTabController.trailReturnTime
        descriptionField.text = MyCustomTabController.trailDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func submitButton(_ sender: AnyObject) {
        MyCustomTabController.trailName = nameField.text!
        MyCustomTabController.trailLocation = locationField.text!
        MyCustomTabController.trailPeople = peopleField.text!
        MyCustomTabController.trailReturnTime = returnField.text!
        MyCustomTabController.trailDescription = descriptionField.text!
    }
}
