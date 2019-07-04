//
//  ViewProductsController.swift
//  InventoryManagement
//
//  Created by SunnyMac on 17/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class ViewStocksController: UIViewController {

    @IBOutlet weak var stockTableView: UITableView!
    
    
    @IBAction func backButton(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        stockTableView.delegate     = self
        stockTableView.dataSource   = self
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
    }
}

extension ViewStocksController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductTableViewCell
        
        cell.productName.text = "123"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProductTableViewCell
        
        selectedCell.productDetailsOutlet.isHidden = false
        
        print("1")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProductTableViewCell
        
        selectedCell.productDetailsOutlet.isHidden = true
        
        print("2")
    }
}
