import Foundation
import UIKit
import Alamofire

public class productFunctions
{
    
    let connections = staticLinks()
    var token:String?
    var productList = [Product?]()
    var userServices = userFunctions()
    var selectedProduct:Product?
    var product1:[String:Any]?
    
    
    func addProduct(token:String,product:Product, completion:@escaping( Error? )->Void)
    {
        let addProductHeader:HTTPHeaders   = [
                                        "token":"\(token)",
            
                                            "Accept":"application/json"
                                           ]
        
        let addProductParameter:Parameters = [
                                              "name":"\(product.name!)",
                                              "manufacture":"\(product.manufacture!)",
                                              "description":"\(product.descriptionField!)",
                                              "amount":product.amount!,
                                              "quantity":product.quantity!,
                                              "date":"\(product.date!)"
                                             ]
        
        AF.request("https://app-inventory.herokuapp.com/AddProduts", method: .post, parameters: addProductParameter, encoding: JSONEncoding.default, headers: addProductHeader).responseJSON
            {
                (response) in
                let encode = JSONEncoder()
                encode.outputFormatting = .prettyPrinted
                do
                {
                    let jsonData = try encode.encode(product)
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
    
    func getProduct(token:String, completion:@escaping(Bool?, [Product?]? , Error?)->Void)
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        self.token = delegate.mainToken!
        
        print("SELF TOKEN = \(self.token!)")
        
        let getProductHeader:HTTPHeaders   = [
                                            "token":"\(self.token!)",
            
                                                "Accept":"application/json"
                                             ]
        
        
        AF.request("\(connections.getProduct)", method: .get, encoding: JSONEncoding.default, headers: getProductHeader).responseJSON
            {
                (response) in
                
                print("Response: \(String(describing: response.response))")
                print("Result: \(String(describing: response.result))")
                
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
                                                                self.productList = try decoder.decode([Product].self, from: jsonData)
                                                                print("SSSSSS \(self.productList) SSSSSSSS")
                                                            }
                                                            catch
                                                            {
                                                                print(error.localizedDescription)
                                                            }
                                                    completion( true, self.productList , nil )
                                                    }
                                                    catch
                                                    {
                                                        print("Login failed. \(error.localizedDescription)")
                                                        completion( nil , nil , error )
                                                    }
                    }
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
    
    
    func getOneProduct(token:String, productID: Int?, completion:@escaping(Bool?, Product? , Error?)->Void)
    {
        let getStoreHeader:HTTPHeaders   = [
            "token":"\(token)",
            
            "Accept":"application/json"
        ]
        
        
        AF.request("\(connections.getProduct)", method: .get, encoding: JSONEncoding.default, headers: getStoreHeader).responseJSON
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
                    for i in obj
                    {
                        let products = i as! [String:Any]
                        let productssID = products["id"] as! Int
                        if productssID == productID
                        {
                            self.product1 = products
                        }
                        else
                        {
                            print("no such id")
                        }
                    }
                    let jsonData = try! JSONSerialization.data(withJSONObject: self.product1, options: JSONSerialization.WritingOptions.prettyPrinted)
                    let decoder = JSONDecoder()
                    do
                    {
                        self.selectedProduct = try decoder.decode(Product.self, from: jsonData)
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                    
                    completion( true, self.selectedProduct , nil )
                }
                catch
                {
                    print("Login failed. \(error.localizedDescription)")
                    completion( nil , nil , error )
                    }
                }
        }
    }
    
    
    func deleteProduct()
    {
        
    }
}




