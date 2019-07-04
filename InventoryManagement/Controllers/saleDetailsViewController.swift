//
//  saleDetailsViewController.swift
//  InventoryManagement
//
//  Created by SunnyMac on 04/07/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class saleDetailsViewController: UIViewController
{

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var saleVolume: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
