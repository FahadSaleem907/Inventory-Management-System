//
//  productDetailsViewController.swift
//  InventoryManagement
//
//  Created by SunnyMac on 04/07/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class productDetailsViewController: UIViewController {

    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var purchaseDate: UILabel!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
