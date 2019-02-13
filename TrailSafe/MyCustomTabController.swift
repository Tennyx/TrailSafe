//
//  MyCustomTabController.swift
//  CaleIOSResume
//
//  Created by Cale Switzer on 2/9/19.
//  Copyright © 2019 cale. All rights reserved.
//

import UIKit

struct ContactObject {
    var contactName: String
    var contactPhone: String
    var contactEmail: String
    var isOn = false
}

class MyCustomTabController: UITabBarController {
    static var contactsData = [ContactObject]()
    static var trailName = ""
    static var trailLocation = ""
    static var trailPeople = ""
    static var trailReturnTime = ""
    static var trailDescription = ""
}
