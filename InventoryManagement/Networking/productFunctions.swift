//
//  basicFunctions.swift
//  InventoryManagement
//
//  Created by SunnyMac on 24/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public struct productFunctions
{
    func addProduct(token:String)
    {
        let addProductHeader:HTTPHeaders   = [
                                        "token":"\(token)",
            
                                            "Accept":"application/json"
                                           ]
        
        let addProductParameter:Parameters = [
                                              "name":"Dell",
                                              "manufacture":"Dell",
                                              "description":"Laptop",
                                              "amount":60016,
                                              "quantity":1616,
                                              "date":"2016-10-10"
                                             ]
        
        AF.request("https://app-inventory.herokuapp.com/AddProduts", method: .post, parameters: addProductParameter, encoding: JSONEncoding.default, headers: addProductHeader).responseJSON
            {
                (response) in
                
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
            }
    }
    
    func getProduct(token:String)
    {
        let getProductHeader:HTTPHeaders   = [
                                            "token":"\(token)",
            
                                                "Accept":"application/json"
                                             ]
        
        
        AF.request("https://app-inventory.herokuapp.com/getProducts", method: .get, encoding: JSONEncoding.default, headers: getProductHeader).responseJSON
            {
                (response) in
                
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
        }
    }

    func editProduct(token:String)
    {
        let editProductHeader:HTTPHeaders   = [
            "token":"\(token)",
            
            "Accept":"application/json"
        ]
        
        let editProductParameter:Parameters = [
            "name":"Hp EliteBook",
            "manufacture":"HP latops",
            "description":"LAptop",
            "amount":60000,
            "quantity":500,
            "date":"2018-10-10",
            "pid":2
        ]
        
        AF.request("https://app-inventory.herokuapp.com/AddProduts", method: .post, parameters: editProductParameter, encoding: JSONEncoding.default, headers: editProductHeader).responseJSON
            {
                (response) in
                
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
        }
    }
    
    func deleteProduct()
    {
        
    }
}




