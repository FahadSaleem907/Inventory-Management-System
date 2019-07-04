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

public class storeFunctions
{
    var token:String?
    //var currentStores:stores?
    var storeList = [stores?]()
    var userServices = userFunctions()
    
    
    
    func addStore(token:String)
    {
        
        
        let addStoreHeader:HTTPHeaders   = [
                                        "token":"\(token)",
                                        
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
    
    func getStores(token:String, completion:@escaping(Bool?, [stores?]? , Error?)->Void)
    {
        let getStoreHeader:HTTPHeaders   = [
                                        "token":"\(token)",
                                        
                                            "Accept":"application/json"
                                           ]

        
        AF.request("https://app-inventory.herokuapp.com/getStores", method: .get, encoding: JSONEncoding.default, headers: getStoreHeader).responseJSON
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
   
                                                    
                                                    //print("For Store: Obj = \(obj)")
                                                    //print("For Store: JSOn = \(json)")
                                                    
                                                    let jsonData = try! JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted)
                                                    
                                                    let decoder = JSONDecoder()
                                                    
                                                    do
                                                    {
                                                        self.storeList = try decoder.decode([stores].self, from: jsonData)
                                                        //print("\n\(self.store.) ----- \(self.user!.name!) ----- \(self.user!.email!)")
                                                        
                                                    }
                                                    catch
                                                    {
                                                        print(error.localizedDescription)
                                                    }
                                                    
                                                    completion( true, self.storeList , nil )
                                                }
                    
                                                catch
                                                    {
                                                        print("Login failed. \(error.localizedDescription)")
                    
                                                        completion( nil , nil , error )
                                                    }
                }
            }
    }
    
    func editStore()
    {
        
    }
    
    func deleteStore()
    {
        
    }
}
