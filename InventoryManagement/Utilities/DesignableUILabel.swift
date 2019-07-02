//
//  DesignableUILabel.swift
//  InventoryManagement
//
//  Created by SunnyMac on 18/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class designableUILabel : UILabel
{
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0
        {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable public var applyEffects : Bool = false
        {
            didSet
                {
                    self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                }
        }
    
}
