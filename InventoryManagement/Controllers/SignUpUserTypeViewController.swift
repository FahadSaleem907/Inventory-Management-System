//
//  SignUpUserTypeViewController.swift
//  InventoryManagement
//
//  Created by FahadSaleem on 02/07/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class SignUpUserTypeViewController: UIViewController {

    
    var tmpUser:users?
    
    @IBAction func userType(_ sender: UISegmentedControl)
    {
        if userTypeOut.selectedSegmentIndex == 0
        {
            userAlert(msg: "Are you sure you want to create new Admin", controller: self)
        }
        if userTypeOut.selectedSegmentIndex == 1
        {
            userAlert(msg: "Are you sure you want to create New User", controller: self)
            
            self.dismiss(animated: false)
            {
                print("User Selected")
            }
        }
    }
    
    @IBOutlet weak var userTypeOut: UISegmentedControl!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}


extension SignUpUserTypeViewController
{
    func userAlert(msg:String, controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        
        let buttonYes = UIAlertAction(title: "Yes", style: .default) { (_) in
            if self.userTypeOut.selectedSegmentIndex == 0
            {
                
                self.tmpUser?.email = nil
                self.tmpUser?.name = nil
                self.tmpUser?.password = nil
                self.tmpUser?.id = 0
                self.tmpUser?.role = true
                
                print(self.tmpUser)
            }
            else
            {
                
            }
            
            self.performSegue(withIdentifier: "signUpScreen", sender: self)
        }
        
        let buttonNo = UIAlertAction(title: "No", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertValidation.addAction(buttonYes)
        alertValidation.addAction(buttonNo)
        
        present(alertValidation, animated: true, completion: nil)
        
        
    }
}
