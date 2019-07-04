//
//  ProductTableViewCell.swift
//  InventoryManagement
//
//  Created by FahadSaleem on 04/07/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDetailsOutlet: UIButton!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        productDetailsOutlet.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
