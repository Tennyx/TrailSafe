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
}

class MyCustomTabController: UITabBarController {
    static var contactsData = [ContactObject]()
}
