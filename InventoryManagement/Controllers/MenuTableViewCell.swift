//
//  MenuTableViewCell.swift
//  InventoryManagement
//
//  Created by SunnyMac on 18/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    //@IBOutlet weak var menuItem: UILabel!
   
    //@IBOutlet weak var menuItem: UILabel!
    
    @IBOutlet weak var menuItem: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
