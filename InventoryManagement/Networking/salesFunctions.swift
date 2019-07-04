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

public class salesFunctions
{
    let connections = staticLinks()
    var token:String?
    var salesList = [sales?]()
    var userServices = userFunctions()
    
    
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
    
    func getSales(token:String, completion:@escaping(Bool?, [sales?]? , Error?)->Void)
    {
        let getSaleHeader:HTTPHeaders   = [
            "token":"\(token)",
            
            "Accept":"application/json"
        ]
        
        
        AF.request("\(connections.getSales)", method: .get, encoding: JSONEncoding.default, headers: getSaleHeader).responseJSON
            {
                (response) in
                
                //print("Response: \(String(describing: response.response))")
                //print("Result: \(String(describing: response.result))")
                
                switch response.result
                    
                {
                case .failure(let error)    :   print(error.localizedDescription)
                    
                case .success               :   do
                                                    {
                                                        let json = try response.result.get() as! [String:Any]
                                                        let obj = json["data"] as! [Any]
                    
                    
                                                        print("For Store: Obj = \(obj)")
                                                        print("For Store: JSOn = \(json)")
                                                        print("Result : \(response.result)")
                    
                                                        let jsonData = try! JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted)
                    
                                                        let decoder = JSONDecoder()
                    
                                                        do
                                                            {
                                                                self.salesList = try decoder.decode([sales].self, from: jsonData)
                                                                //print("\n\(self.store.) ----- \(self.user!.name!) ----- \(self.user!.email!)")
                        
                                                                print("SSSSSS \(self.salesList) SSSSSSSS")
                                                            }
                                                            catch
                                                            {
                                                                print(error.localizedDescription)
                                                            }
                    
                                                        completion( true, self.salesList , nil )
                                                    }
                                                    catch
                                                    {
                                                        print("Login failed. \(error.localizedDescription)")
                    
                                                        completion( nil , nil , error )
                                                    }
                }
        }
    }
    
    func editSale()
    {
        
    }
    
    func deleteSale()
    {
        
    }
    
}
