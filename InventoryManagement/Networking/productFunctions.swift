import Foundation
import UIKit
import Alamofire

public class productFunctions
{
    
    let connections = staticLinks()
    var token:String?
    var productList = [products?]()
    var userServices = userFunctions()
    
    
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
    
    func getProduct(token:String, completion:@escaping(Bool?, [products?]? , Error?)->Void)
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
                                                                self.productList = try decoder.decode([products].self, from: jsonData)
                        //print("\n\(self.store.) ----- \(self.user!.name!) ----- \(self.user!.email!)")
                        
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
    
    func deleteProduct()
    {
        
    }
}




