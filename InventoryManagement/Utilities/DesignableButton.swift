//
//  designableButton.swift
//  InventoryManagement
//
//  Created by SunnyMac on 15/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class designableUIButton : UIButton
{
    var isRoundedCorners = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0
        {
        didSet
            {
                if cornerRadius > 0
                {
                    self.layer.cornerRadius = cornerRadius
                    self.layer.masksToBounds = false
                    //isRoundedCorners = true
                }
                else
                {
                    isRoundedCorners = false
                }
            }
        }
    
    @IBInspectable public var applyEffect1 : Bool = false
        {
            didSet
                {
                    self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    self.layer.borderWidth = 0.5
                    self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    
                    self.layer.shadowColor = UIColor.white.cgColor
                    self.layer.shadowRadius = 5
                    self.layer.shadowOpacity = 0.8
                    self.layer.shadowOffset = CGSize(width: 1, height: 1)
                }
        }
    
    @IBInspectable public var applyEffect2 : Bool = false
        {
            didSet
                {
                    self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    //self.layer.borderWidth = 0.5
                    //self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
                    self.layer.shadowColor = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
                    self.layer.shadowRadius = 5
                    self.layer.shadowOpacity = 0.8
                    self.layer.shadowOffset = CGSize(width: 1, height: 1)
                }
        }
    
    @IBInspectable public var applyEffect3 : Bool = false
        {
            didSet
                {
                    self.layer.shadowColor = UIColor.black.cgColor
                    self.layer.shadowRadius = 5
                    self.layer.shadowOpacity = 0.5
                    self.layer.shadowOffset = CGSize(width: 0, height: 3)
                }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .allowUserInteraction, animations:
            {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
    
}
