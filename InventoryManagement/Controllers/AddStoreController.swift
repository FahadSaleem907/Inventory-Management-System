import Foundation
import UIKit

class addStoreController : UIViewController
{
    
    
    
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
