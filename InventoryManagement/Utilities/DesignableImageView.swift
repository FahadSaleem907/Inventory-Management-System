//
//  DesignableButtons.swift
//  InventoryManagement
//
//  Created by SunnyMac on 15/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class designableUIImageView : UIImageView
{
    
    var isRoundedCorners = false
    
    @IBInspectable public var roundFrame : Bool = false
        {
            didSet
                {
                    //self.layer.cornerRadius = self.frame.height / 2
                    //self.layer.masksToBounds = false
                    self.contentMode = .scaleAspectFill
                    isRoundedCorners = true
                }
        }
    
        override func layoutSubviews()
        {
            super.layoutSubviews()

            if isRoundedCorners == true
            {
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height)).cgPath

                layer.mask = shapeLayer
            }
            else
            {
                layer.mask = nil
            }
        }
}
