//
//  salesFunctions.swift
//  InventoryManagement
//
//  Created by SunnyMac on 26/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public struct salesFunctions
{
    let connections = staticLinks()
    
    func addSales()
    {
        let addSaleHeader:HTTPHeaders   = [
            "token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTksImV4cCI6MTU2MTU1NTgwM30.3hk2K2aO9z4PvBjz6NDmJP7KDP_G46zmdlmi5q2B9_k",
            
            "Accept":"application/json"
        ]
        
        let addSaleParameter:Parameters = [
                                                "pid":1,
                                                "sid":1,
                                                "saleDate":"2017-03-23",
                                                "quantity":80,
                                                "stockSold":0
                                             ]
        
        AF.request("\(connections.addSale)", method: .post, parameters: addSaleParameter, encoding: JSONEncoding.default, headers: addSaleHeader).responseJSON
            {
                (response) in
                
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
            }
    }
    
    func getSales()
    {
        let getSaleHeader:HTTPHeaders   = [
            "token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTksImV4cCI6MTU2MTU1NTgwM30.3hk2K2aO9z4PvBjz6NDmJP7KDP_G46zmdlmi5q2B9_k",
            
            "Accept":"application/json"
        ]
        
        
        AF.request("\(connections.getSales)", method: .get, encoding: JSONEncoding.default, headers: getSaleHeader).responseJSON
            {
                (response) in
                
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
        }
    }
    
    func editSale()
    {
        
    }
    
    func deleteSale()
    {
        
    }
    
}
