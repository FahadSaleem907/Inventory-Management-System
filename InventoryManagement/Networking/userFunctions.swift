import Foundation
import UIKit
import Alamofire

public class userFunctions
{
    var token:String = ""
    var user:User?
    let connections = staticLinks()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func signUp(email:String, password:String, name:String, role:Bool, completion:@escaping(Bool, [String:Any]?, String?, Error?) -> Void)
    {
        let signupParameters: Parameters = ["email":"fahad@saleem.com","name":"fs","password":"123","Role":"1"]
        
        AF.request("\(connections.signUp)", method: .post, parameters: signupParameters, encoding: JSONEncoding.default).responseJSON
            {
                (response) in
                
            print("Response: \(String(describing: response.response))")
            print("Result: \(String(describing: response.result))")
                
            }
    }
    
    
    func login(email:String,password:String, completion:@escaping(Bool, User?, String?, Error?) -> Void)
    {
        let loginParameters:Parameters = ["email":"\(email)", "password":"\(password)"]
        
        AF.request("\(connections.login)", method: .post, parameters: loginParameters, encoding: JSONEncoding.default).validate().responseJSON
            {
                (response) in
                
                switch response.result
                {
                case .failure(let error)    : print(error.localizedDescription)
                    
                case .success               : do
                                                {
                                                    let json = try response.result.get() as! [String:Any]
                                                    let obj = json["data"] as! [String:Any]
                                                    
                                                    //Getting Token
                                                    let currentToken = obj["token"] as! String
                                                    self.token = currentToken
                                                    self.delegate.mainToken = currentToken
                                                    
                                                    
                                                    //Getting User Data
                                                    let userData = obj["user"] as! [String:Any?]
                                                    print("DDDDDDDD  \(json)")
                                                    let jsonData = try! JSONSerialization.data(withJSONObject: userData, options: JSONSerialization.WritingOptions.prettyPrinted)
                                                    
                                                    let decoder = JSONDecoder()
                                                    
                                                    print("For USER: \(userData)")
                                                    do
                                                        {
                                                            self.user = try decoder.decode(User.self, from: jsonData)
                                                            print("\n\(self.user!.role!) ----- \(self.user!.name!) ----- \(self.user!.email!)")
                                                            
                                                            self.delegate.currentUser = self.user
                                                            
                                                        }
                                                    catch
                                                        {
                                                            print(error.localizedDescription)
                                                        }
                    
                                                    completion( true, self.user, self.token, nil )
                                                }
                    
                                                catch
                                                {
                                                    print("Login failed. \(error.localizedDescription)")
                                                    
                                                    completion( false, nil, nil ,error)
                                                }
                }
            }

    }
    
    func editAccountSettings()
    {
        
    }
    
    func deactivateAccount()
    {
        
    }
    
}
