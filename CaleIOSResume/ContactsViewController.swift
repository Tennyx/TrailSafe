//
//  ContactsViewController.swift
//  CaleIOSResume
//
//  Created by Cale Switzer on 2/9/19.
//  Copyright © 2019 cale. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contactsIndex = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayData(contactsIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayData(_ contactIndex: Int){
        let contactObject = MyCustomTabController.contactsData[contactIndex]
        
        nameLabel.text = contactObject.contactName
        phoneLabel.text = contactObject.contactPhone
        emailLabel.text = contactObject.contactEmail
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactsVC = segue.destination as! AddContactViewController
        contactsVC.contactsIndex = self.contactsIndex
    }
}
