import UIKit
import SideMenu

class MainViewController: UIViewController
{
    var menuShowing:Bool = false
    var adminMenuItems = ["Dashboard" , "Add Stores" , "View Stores" ]
    var clientMenuItems = ["Dashboard" , "Add Product" , "Add Sale Details" , "View Stocks" , "View Sales" ]
    var user = ""
    var count = 0
    var userService = userFunctions()
    
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var menuView: UIView!

    override func viewWillAppear(_ animated: Bool)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isScrollEnabled = false
        //cleanSelection()
        
        menuView.layer.shadowOpacity = 1
        navigationController?.isNavigationBarHidden = true
        
        }
}

extension MainViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if user == "true"
        {
            count = adminMenuItems.count
        }
        if user == "false"
        {
            count = clientMenuItems.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        if user == "true"
        {
            cell.backgroundColor = UIColor.clear
            cell.layer.cornerRadius = 25
            cell.layer.masksToBounds = true
            
            cell.menuItem.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
            cell.menuItem.textColor = UIColor.white
            cell.menuItem.text = "\(adminMenuItems[indexPath.row])"
        }
        if user == "false"
        {
            cell.backgroundColor = UIColor.clear
            cell.layer.cornerRadius = 25
            cell.layer.masksToBounds = true
            
            cell.menuItem.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
            cell.menuItem.textColor = UIColor.white
            cell.menuItem.text = "\(clientMenuItems[indexPath.row])"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
            return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell: MenuTableViewCell = menuTableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.menuItem.text == "Add Stores"
        {
            performSegue(withIdentifier: "addStoreScreen", sender: self)
        }
        if cell.menuItem.text == "Add Product"
        {
            performSegue(withIdentifier: "addProductScreen", sender: self)
        }
        if cell.menuItem.text == "Add Sale Details"
        {
            performSegue(withIdentifier: "saleDetailScreen", sender: self)
        }
        if cell.menuItem.text == "View Stores"
        {
            performSegue(withIdentifier: "viewStoresScreen", sender: self)
        }
        if cell.menuItem.text == "View Stocks"
        {
            performSegue(withIdentifier: "viewStocksScreen", sender: self)
        }
        if cell.menuItem.text == "View Sales"
        {
            performSegue(withIdentifier: "viewSalesScreen", sender: self)
        }
    }
    
}
