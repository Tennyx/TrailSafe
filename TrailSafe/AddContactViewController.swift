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
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    var contactsIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prefillInputs(contactIndex: contactsIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func submitButton(_ sender: AnyObject) {
        var contactName = ContactObject(contactName: nameField.text!, contactPhone: phoneField.text!, contactEmail: emailField.text!, isOn: false)
        
        if contactsIndex >= 0 {
            let currentSwitchState = MyCustomTabController.contactsData[contactsIndex].isOn
            contactName.isOn = currentSwitchState
            MyCustomTabController.contactsData[contactsIndex] = contactName
        }
        else {
            MyCustomTabController.contactsData.append(contactName as ContactObject)
        }
        performSegue(withIdentifier: "returnToTrailSafe", sender: nil)
    }
    
    func prefillInputs(contactIndex: Int){
        if contactIndex >= 0 {
            let contactObject = MyCustomTabController.contactsData[contactsIndex]
            
            nameField.text = contactObject.contactName
            phoneField.text = contactObject.contactPhone
            emailField.text = contactObject.contactEmail
        }
    }
}
