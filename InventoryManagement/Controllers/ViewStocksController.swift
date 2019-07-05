import UIKit

class ViewStocksController: UIViewController {

    var finalData = [products]()
    var productServices = productFunctions()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBOutlet weak var stockTableView: UITableView!
    
    
    @IBAction func backButton(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    func getData()
    {
        productServices.getProduct(token: self.delegate.mainToken!)
        {
            (success, productList, error) in
            
            
            guard let productList = productList else { return }
            
            print("++++++++++++++ \(productList) ++++++++++++++")
            self.finalData = productList as! [products]
            self.stockTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        stockTableView.delegate     = self
        stockTableView.dataSource   = self
        
        getData()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
    }
}

extension ViewStocksController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductTableViewCell
        
        cell.productName.text = finalData[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return finalData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProductTableViewCell
        
        selectedCell.productDetailsOutlet.isHidden = false
        
        print("1")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProductTableViewCell
        
        selectedCell.productDetailsOutlet.isHidden = true
        
        print("2")
    }
}
