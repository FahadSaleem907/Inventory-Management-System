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
            
            //print("============== \(self.finalData)  =============")
            
            //print(">>>>>>>> \(self.delegate.currentUser) <<<<<<<<<<<")
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
//        print("Token: \(self.delegate.mainToken!)")
//        print("User Email: \(self.delegate.currentUser!.email!)")
//        print("User PW: \(self.delegate.currentUser!.password!)")
    }

}

extension ViewStoresController: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StoreTableViewCell
        
        cell.storeName.text = "AaAaA"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        return print("1")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        return print("1")
    }
    
}