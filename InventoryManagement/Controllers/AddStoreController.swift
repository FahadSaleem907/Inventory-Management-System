//
//  RevealViewController.swift
//  InventoryManagement
//
//  Created by SunnyMac on 17/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

class addStoreController : UIViewController
{
    
    
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad()
    {
       super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
    }
}
