//
//  designableUIView.swift
//  InventoryManagement
//
//  Created by FahadSaleem on 02/07/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class designableUIView:UIView
{
    @IBInspectable
    public var cornerRadius:CGFloat = 0.0
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = false
        }
    }
    
}

@IBDesignable
class designableSegmentView:UISegmentedControl
{
    @IBInspectable
    public var cornerRadius:CGFloat = 0.0
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
}
