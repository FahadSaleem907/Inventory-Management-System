import Foundation
import UIKit

class addStoreController : UIViewController
{
    
    @IBOutlet weak var storeName: fancyTextField!
    @IBOutlet weak var location: fancyTextField!
    
    let storeService = storeFunctions()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBAction func createStore(_ sender: designableUIButton)
    {
        if storeName.text?.isEmpty == true
        {
            alert(msg: "Enter Store Name", controller: self, textField: storeName)
        }
        else if location.text?.isEmpty == true
        {
            alert(msg: "Enter Store Location", controller: self, textField: location)
        }
        else
        {
            let store1 = Store(storename: storeName.text!, location: location.text!)
            print(store1)
            storeService.addStore(token: self.delegate.mainToken!, store: store1)
            {
                (error) in
                if error == nil
                {
                    self.successAlert(msg: "Store Create Successfully", controller: self)
                }
                else
                {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
    }
}


extension addStoreController
{
    func alert(msg:String , controller:UIViewController, textField:UITextField)
    {
        let alertValidation = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default)
        {
            (_) in textField.becomeFirstResponder()
        }
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    func successAlert(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true) })
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }

}
