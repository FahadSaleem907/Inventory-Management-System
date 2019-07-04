//
//  StoreTableViewCell.swift
//  InventoryManagement
//
//  Created by FahadSaleem on 03/07/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell
{

    @IBOutlet weak var storeName: UILabel!
    
    @IBAction func storeDetailAct(_ sender: UIButton)
    {
        
    }
    
    @IBOutlet weak var storeDetailOut: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
