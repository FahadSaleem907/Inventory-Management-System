import UIKit

class ViewStocksController: UIViewController {

    var tmpProduct:Product?
    var finalData = [Product]()
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
            self.finalData = productList as! [Product]
            self.stockTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToProductDetails = segue.destination as! productDetailsViewController
        
        goToProductDetails.tmpProduct = tmpProduct
    }
    
    
    //override func viewWillAppear(_ animated: Bool)
    //{
        //getData()
        //shaderBtn.isHidden = true
        //shaderBtn.alpha = 0
    //}
    
    
    
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
        tmpProduct = finalData[indexPath.row]
        
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProductTableViewCell
        selectedCell.productDetailsOutlet.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProductTableViewCell
        selectedCell.productDetailsOutlet.isHidden = true
    }


    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let delete = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .destructive, title: "Delete")
        {
            (delete, view, completion) in
            
            func userAlert(msg:String, controller:UIViewController)
            {
                let alertValidation = UIAlertController(title: "", message: msg, preferredStyle: .alert)
                let buttonYes = UIAlertAction(title: "Yes", style: .default)
                { (_) in
                    self.productServices.deleteProduct(token: self.delegate.mainToken!, productID: self.finalData[indexPath.row].pid!, completion:
                        {
                            ( success , error, msg) in
                            if success == true
                            {
                                self.successAlert(msg: "Product Successfully Deleted", controller: self)
                                self.stockTableView.reloadData()
                                completion(true)
                            }
                            else
                            {
                                self.failureAlert(msg: "Failed to Delete Product. \n\(error)", controller: self)
                                //self.stockTableView.reloadData()
                                return
                            }
                    })
                }
                let buttonNo = UIAlertAction(title: "No", style: .default, handler: nil)
                alertValidation.addAction(buttonYes)
                alertValidation.addAction(buttonNo)
                self.present(alertValidation, animated: true, completion: nil)
            }
            
            userAlert(msg: "Do you want to delete the selected product ?", controller: self)
        }
        
        
        action.backgroundColor = .red
        return action
    }
}

extension ViewStocksController
{
    func successAlert(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    func failureAlert(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Failed", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
}


