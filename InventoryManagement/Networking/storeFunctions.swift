//
//  storeFunctions.swift
//  InventoryManagement
//
//  Created by SunnyMac on 26/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public struct storeFunctions
{
    var token:String?
    
    var userServices = userFunctions()
    
    func addStore()
    {
        
        
        let addStoreHeader:HTTPHeaders   = [
                                        "token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTksImV4cCI6MTU2MTU1NDU2NH0.7lLZdYrAAv01MDre26jvk6N2WzS1QymEcr6nqf9DVvc",
                                        
                                            "Accept":"application/json"
                                           ]
        
        let addStoreParameter:Parameters = [
                                            "storeName":"Galaxy computer",
                                            "location":"technocity karachi"
                                           ]
        
        AF.request("https://app-inventory.herokuapp.com/addStores", method: .post, parameters: addStoreParameter, encoding: JSONEncoding.default, headers: addStoreHeader).responseJSON
            {
                (response) in
            
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
            }
    }
    
    func getStores()
    {
        let getStoreHeader:HTTPHeaders   = [
                                        "token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTksImV4cCI6MTU2MTU1NDk5NH0.4KUFCQYi7WSNiiSOI_9Ml-Xc9ChEJ-kLbMOOfgyLEvY",
                                        
                                            "Accept":"application/json"
                                           ]

        
        AF.request("https://app-inventory.herokuapp.com/getStores", method: .get, encoding: JSONEncoding.default, headers: getStoreHeader).responseJSON
            {
                (response) in
            
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
            }
    }
    
    func editStore()
    {
        
    }
    
    func deleteStore()
    {
        
    }
}
