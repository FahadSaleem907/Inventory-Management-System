import UIKit

class ViewStoresController: UIViewController {

    var finalData = [stores]()
    var storeServices = storeFunctions()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBOutlet weak var storeTableView: UITableView!
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }

    func getData()
    {
        storeServices.getStores(token: self.delegate.mainToken!) { (success , storeList , error) in
            
            
            guard let storeList = storeList else { return }
            
            print("++++++++++++++ \(storeList) ++++++++++++++")
            
            self.finalData = storeList as! [stores]
            
            self.storeTableView.reloadData()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
        
        storeTableView.delegate     = self
        storeTableView.dataSource   = self
        
        getData()
    }

}

extension ViewStoresController: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return finalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StoreTableViewCell
        
        cell.storeName.text     = finalData[indexPath.row].storeName
        cell.storeLocation.text = finalData[indexPath.row].location
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
}
