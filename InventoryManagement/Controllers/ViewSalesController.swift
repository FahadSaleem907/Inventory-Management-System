import UIKit

class ViewSalesController: UIViewController {

    var finalData = [CompleteSale]()
    var salesServices = salesFunctions()
    var tmpSale:CompleteSale?
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var saleTableView: UITableView!
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    func getData()
    {
        salesServices.getSales(token: self.delegate.mainToken!)
        {
            (success , salesList , error) in
            guard let salesList = salesList else { return }
            print("++++++++++++++ \(salesList) ++++++++++++++")
            self.finalData = salesList as! [CompleteSale]
            self.saleTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToSaleDetails = segue.destination as! saleDetailsViewController
        goToSaleDetails.tmpSale = tmpSale
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        saleTableView.delegate      = self
        saleTableView.dataSource    = self
        
        getData()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
    }
}

extension ViewSalesController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! salesTableViewCell
        cell.sale.text = String(finalData[indexPath.row].sale!.id!)
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
        tmpSale = finalData[indexPath.row]
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! salesTableViewCell
        selectedCell.showDetailsOutlet.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! salesTableViewCell
        selectedCell.showDetailsOutlet.isHidden = true
    }
}
