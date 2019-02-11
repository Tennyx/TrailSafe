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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var returnTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var editTrailInfoButton: UIButton!
 
    
    var buttonIndexPressed = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
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
            
            newSwitch.tag = indexArray
            newSwitch.isOn = MyCustomTabController.contactsData[indexArray].isOn
            newSwitch.addTarget(self, action: #selector(contactSwitchToggle(_:)), for: UIControlEvents.touchUpInside)
            
            stackViewRow.addArrangedSubview(newSwitch)
            stackViewRow.addArrangedSubview(newName)
            stackViewRow.spacing = 20
            contactsStackView.addArrangedSubview(stackViewRow)
            indexArray += 1
        }
        
        nameLabel.text = MyCustomTabController.trailName
        locationLabel.text = MyCustomTabController.trailLocation
        peopleLabel.text = MyCustomTabController.trailPeople
        returnTimeLabel.text = MyCustomTabController.trailReturnTime
        descriptionLabel.text = MyCustomTabController.trailDescription
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addContact(_ sender: AnyObject) {
        performSegue(withIdentifier: "contactForm", sender: nil)
    }
    
    @IBAction func toggleTrailSafe(_ sender: AnyObject) {
        if trailSafeActivateButton.isOn {
            if anySwitchesOn() && trailInfoComplete(){
                print("all good")
                addContactButton.isEnabled = false
                editTrailInfoButton.isEnabled = false
            }
            else {
                errorLabel.text = "Toggle at least 1 contact and fill out trail info."
                trailSafeActivateButton.isOn = false
            }
        }
        else {
            addContactButton.isEnabled = true
            editTrailInfoButton.isEnabled = true
        }
    }
    
    func setIndex(_ sender: AnyObject) {
        buttonIndexPressed = sender.tag
        performSegue(withIdentifier: "contactView", sender: nil)
    }
    
    func contactSwitchToggle(_ sender: UISwitch) {
        let currentState = !sender.isOn
        
        if trailSafeActivateButton.isOn {
            sender.isOn = currentState
        }
        else{
            MyCustomTabController.contactsData[sender.tag].isOn = sender.isOn
            errorLabel.text = ""
        }
    }
    
    func anySwitchesOn() -> Bool{
        let contactArray = MyCustomTabController.contactsData
        
        for contact in contactArray {
            if contact.isOn == true {
                return true
            }
        }
        return false
    }
    
    func trailInfoComplete() -> Bool{
        if MyCustomTabController.trailName == ""{
            return false
        }
        else if MyCustomTabController.trailLocation == ""{
            return false
        }
        else if MyCustomTabController.trailPeople == ""{
            return false
        }
        else if MyCustomTabController.trailReturnTime == ""{
            return false
        }
        else if MyCustomTabController.trailDescription == ""{
            return false
        }
        else{
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "contactView") {
            let contactsVC = segue.destination as! ContactsViewController
            contactsVC.contactsIndex = buttonIndexPressed
        }
    }
}
