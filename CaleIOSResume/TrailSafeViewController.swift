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
    
    let xPos : CGFloat = 0
    var yPos : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        trailSafeActivateButton.isOn = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testFunc(_ sender: AnyObject) -> String{
        print("skald")
        return "wardruna"
    }
    
    @IBAction func addTest(_ sender: AnyObject) {
        yPos += 22
        let newSwitch = UISwitch()
        let newName = UIButton()
        let stackViewRow = UIStackView()
        
        newName.setTitle("Hello", for: .normal)
        newName.setTitleColor(UIColor.black, for: .normal)
        newName.addTarget(self, action: #selector(testFunc(_:)), for: UIControlEvents.touchUpInside)
  
        stackViewRow.addArrangedSubview(newSwitch)
        stackViewRow.addArrangedSubview(newName)
        contactsStackView.addArrangedSubview(stackViewRow)
    }

}
