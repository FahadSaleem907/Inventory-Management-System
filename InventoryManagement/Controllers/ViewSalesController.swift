//
//  ViewSalesController.swift
//  InventoryManagement
//
//  Created by SunnyMac on 17/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import UIKit

class ViewSalesController: UIViewController {

    var finalData = [sales]()
    var salesServices = salesFunctions()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var saleTableView: UITableView!
    
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    

    func getData()
    {
        salesServices.getSales(token: self.delegate.mainToken!)
        {
            (success , salesList , error) in
            
            
            guard let salesList = salesList else { return }
            
            print("++++++++++++++ \(salesList) ++++++++++++++")
            
            self.finalData = salesList as! [sales]
            
            self.saleTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        saleTableView.delegate      = self
        saleTableView.dataSource    = self
        
        getData()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
    }
}

extension ViewSalesController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! salesTableViewCell
        
        cell.sale.text = String(finalData[indexPath.row].sid!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return finalData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! salesTableViewCell
        
        selectedCell.showDetailsOutlet.isHidden = false
        
        print("1")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! salesTableViewCell
        
        selectedCell.showDetailsOutlet.isHidden = true
        
        print("1")
    }
}
