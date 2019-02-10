//
//  TrailSafeViewController.swift
//  CaleIOSResume
//
//  Created by Cale Switzer on 2/8/19.
//  Copyright © 2019 cale. All rights reserved.
//

import UIKit

class TrailSafeViewController: UIViewController {
    @IBOutlet weak var trailSafeActivateButton: UISwitch!
    @IBOutlet weak var contactsStackView: UIStackView!
    @IBOutlet weak var addContactButton: UIButton!
    
    var buttonIndexPressed = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        trailSafeActivateButton.isOn = false
        
        let contactsArray = MyCustomTabController.contactsData
        
        if MyCustomTabController.contactsData.count >= 5 {
            addContactButton.isEnabled = false
        }
        
        
        var indexArray = 0
        
        for contact in contactsArray{
            let newSwitch = UISwitch()
            let newName = UIButton()
            let stackViewRow = UIStackView()
            
            newName.tag = indexArray
            newName.setTitle(contact.contactName, for: .normal)
            newName.setTitleColor(UIColor.black, for: .normal)
            newName.addTarget(self, action: #selector(setIndex(_:)), for: UIControlEvents.touchUpInside)
            newName.contentHorizontalAlignment = .left
            
            stackViewRow.addArrangedSubview(newSwitch)
            stackViewRow.addArrangedSubview(newName)
            stackViewRow.spacing = 20
            contactsStackView.addArrangedSubview(stackViewRow)
            indexArray += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addContact(_ sender: AnyObject) {
        performSegue(withIdentifier: "contactForm", sender: nil)
    }
    
    @IBAction func toggleTrailSafe(_ sender: AnyObject) {
        if trailSafeActivateButton.isOn {
            print("yeeee")
        }
    }
    
    func setIndex(_ sender: AnyObject) {
        buttonIndexPressed = sender.tag
        performSegue(withIdentifier: "contactView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "contactView") {
            let contactsVC = segue.destination as! ContactsViewController
            contactsVC.contactsIndex = buttonIndexPressed
        }
    }
}
