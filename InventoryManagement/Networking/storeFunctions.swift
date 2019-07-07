import Foundation
import UIKit
import Alamofire

public class storeFunctions
{
    
    let connections = staticLinks()
    var token:String?
    var storeList = [Store?]()
    var userServices = userFunctions()
    var selectedStore:Store?
    var store1:[String:Any]?
    
    
    func addStore(token:String,store:Store, completion:@escaping( Error? )->Void)
    {
        let addStoreHeader:HTTPHeaders   = [
                                            "token":"\(token)",
                                            "Accept":"application/json"
                                           ]
        
        let addStoreParameter:Parameters = [
                                            "storeName":"\(store.storeName!)",
                                            "location":"\(store.location!)"
                                           ]
        
        AF.request("https://app-inventory.herokuapp.com/addStores", method: .post, parameters: addStoreParameter, encoding: JSONEncoding.default, headers: addStoreHeader).responseJSON
            {
                (response) in
                let encode = JSONEncoder()
                encode.outputFormatting = .prettyPrinted
                do
                  {
                        let jsonData = try encode.encode(store)
                        print(jsonData)
                    
                        if let jsonString = String(data: jsonData, encoding: .utf8)
                            {
                                print(jsonString)
                            }
                    completion( nil )
                  }
                catch
                {
                    print(error.localizedDescription)
                    completion(error)
                }
            }
    }
    
    
    func getStores(token:String, completion:@escaping(Bool?, [Store?]? , Error?)->Void)
    {
        let getStoreHeader:HTTPHeaders   = [
                                        "token":"\(token)",
                                        
                                            "Accept":"application/json"
                                           ]

        
        AF.request("\(connections.getStore)", method: .get, encoding: JSONEncoding.default, headers: getStoreHeader).responseJSON
            {
                (response) in
            
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
                                                        self.storeList = try decoder.decode([Store].self, from: jsonData)
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
    
    func getOneStores(token:String, storeID: Int?, completion:@escaping(Bool?, Store? , Error?)->Void)
    {
        let getStoreHeader:HTTPHeaders   = [
            "token":"\(token)",
            
            "Accept":"application/json"
        ]
        
        
        AF.request("\(connections.getStore)", method: .get, encoding: JSONEncoding.default, headers: getStoreHeader).responseJSON
            {
                (response) in
                
                switch response.result
                {
                case .failure(let error)    :   print(error.localizedDescription)
                    
                case .success               :   do
                {
                    let json = try response.result.get() as! [String:Any]
                    let obj = json["data"] as! [Any]
                    print("For Store: Obj = \(obj)")
                    //print("For Store: JSOn = \(json)")
                    for i in obj
                    {
                        let stores = i as! [String:Any]
                        
                        let storessID = stores["id"] as! Int
                        
                        if storessID == storeID
                        {
                            self.store1 = stores
                        }
                        else
                        {
                            print("no such id")
                        }
                    }
                    
                    let jsonData = try! JSONSerialization.data(withJSONObject: self.store1, options: JSONSerialization.WritingOptions.prettyPrinted)
                    let decoder = JSONDecoder()
                    do
                    {
                        self.selectedStore = try decoder.decode(Store.self, from: jsonData)
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                    
                    completion( true, self.selectedStore , nil )
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
