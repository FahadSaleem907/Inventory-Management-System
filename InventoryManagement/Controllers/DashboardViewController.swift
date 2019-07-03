import UIKit
import Foundation
import SideMenu


class DashboardViewController: UIViewController
{

    var tmpRole:Bool?
    
    var userServices = userFunctions()
    var storeServices = storeFunctions()
    var productServices = productFunctions()
    var saleServices = salesFunctions()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let getMenu = segue.destination as! UINavigationController
        let menu = getMenu.viewControllers.first as! MainViewController
        
        menu.user = String(tmpRole!)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let width = self.view.frame.width
        SideMenuManager.default.menuWidth = width * 0.75
        // Do any additional setup after loading the view.
    }
    
}
