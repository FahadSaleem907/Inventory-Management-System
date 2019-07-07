import Foundation
import UIKit
import Alamofire

public class salesFunctions
{
    let connections = staticLinks()
    var token:String?
    var salesList = [CompleteSale?]()
    var userServices = userFunctions()
    
    
    func addSales(token:String,sale:CompleteSale, completion:@escaping( Error? )->Void)
    {
        let addSaleHeader:HTTPHeaders   = [
            "token":"\(token)",
            
            "Accept":"application/json"
        ]
        
        let addSaleParameter:Parameters = [
                                                "pid":sale.sale?.pid,
                                                "sid":sale.sale?.storeID,
                                                "saleDate":"\(sale.sale?.saleDate)",
                                                "quantity":sale.sale?.quantity,
                                                "stockSold":sale.sale?.stockSold
                                             ]
        
        AF.request("\(connections.addSale)", method: .post, parameters: addSaleParameter, encoding: JSONEncoding.default, headers: addSaleHeader).responseJSON
            {
                (response) in
                
                let encode = JSONEncoder()
                encode.outputFormatting = .prettyPrinted
                do
                {
                    let jsonData = try encode.encode(sale)
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
    
    
    
    func getSales(token:String, completion:@escaping(Bool?, [CompleteSale?]? , Error?)->Void)
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
                                                        
                                                        print("For Store: JSOn = \(json)")
                                                        
                                                        
                                                        let obj = json["data"] as! [Any]
                    
                                                        //let saleData = obj["sale"] as! [Any]
                                                        
                                                        print("For Store: Obj = \(obj)")
                                                        print("Result : \(response.result)")
                    
                                                        let jsonData = try! JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted)
                    
                                                        let decoder = JSONDecoder()
                    
                                                        do
                                                            {
                                                                self.salesList = try decoder.decode([CompleteSale].self, from: jsonData)
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
