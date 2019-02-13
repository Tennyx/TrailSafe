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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
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
        self.navigationItem.setHidesBackButton(true, animated:true)
        updateUI()
    }
    override func viewDidLayoutSubviews(){
        print(self.view.frame.size.height)
        let contactArraySize = CGFloat(MyCustomTabController.contactsData.count)
        let baseHeight = self.view.frame.size.height
        let contactCellSize = self.view.frame.size.height * 0.05
        let adjustedHeight = baseHeight + (contactArraySize * contactCellSize)
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: adjustedHeight)

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
                editTrailInfoButton.isEnabled = false
                contactsStackView.isUserInteractionEnabled = false
                addContactButton.isEnabled = false
            }
            else {
                errorLabel.text = "Toggle at least 1 contact and fill out excursion info."
                trailSafeActivateButton.isOn = false
            }
        }
        else {
            contactsStackView.isUserInteractionEnabled = true
            if MyCustomTabController.contactsData.count < 5 {
                addContactButton.isEnabled = true
            }
            editTrailInfoButton.isEnabled = true
            
        }
    }
    
    func updateUI(){
        errorLabel.text = ""
        trailSafeActivateButton.isOn = false
        
        if MyCustomTabController.contactsData.count >= 5 {
            addContactButton.isEnabled = false
        }
        else{
            addContactButton.isEnabled = true
        }
        
        let contactsArray = MyCustomTabController.contactsData
        var indexArray = 0
        for view in contactsStackView.subviews {
            if view.tag != 1 {
                view.removeFromSuperview()
            }
        }
        for contact in contactsArray{
            let newSwitch = UISwitch()
            let newName = UIButton()
            let deleteButton = UIButton()
            let stackViewRow = UIStackView()
            
            newName.tag = indexArray
            newName.setTitle(contact.contactName, for: .normal)
            newName.setTitleColor(UIColor(red:0.22, green:0.62, blue:0.21, alpha:1.0), for: .normal)
            newName.addTarget(self, action: #selector(setIndex(_:)), for: UIControlEvents.touchUpInside)
            newName.contentHorizontalAlignment = .left
            
            newSwitch.tag = indexArray
            newSwitch.isOn = MyCustomTabController.contactsData[indexArray].isOn
            newSwitch.onTintColor = UIColor(red:0.22, green:0.62, blue:0.21, alpha:1.0)
            newSwitch.addTarget(self, action: #selector(contactSwitchToggle(_:)), for: UIControlEvents.touchUpInside)
            
            deleteButton.tag = indexArray
            deleteButton.setTitle("x", for: .normal)
            deleteButton.setTitleColor(UIColor(red:0.22, green:0.62, blue:0.21, alpha:1.0), for: .normal)
            deleteButton.setTitleColor(UIColor(red:0.62, green:0.62, blue:0.62, alpha:1.0), for: .disabled)
            deleteButton.addTarget(self, action: #selector(deleteContact(_:)), for: UIControlEvents.touchUpInside)
            
            stackViewRow.addArrangedSubview(newSwitch)
            stackViewRow.addArrangedSubview(newName)
            stackViewRow.addArrangedSubview(deleteButton)
            
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
    
    func deleteContact(_ sender: UIButton) {
        let contactIndex = sender.tag
        MyCustomTabController.contactsData.remove(at: contactIndex)
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "contactView") {
            let contactsVC = segue.destination as! ContactsViewController
            contactsVC.contactsIndex = buttonIndexPressed
        }
    }
}
