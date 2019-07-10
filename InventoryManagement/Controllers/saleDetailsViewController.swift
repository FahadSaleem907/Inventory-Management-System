import UIKit

class saleDetailsViewController: UIViewController
{
    var tmpSale:CompleteSale?
    var sale:CompleteSale?
    
    @IBOutlet weak var saleid: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    @IBOutlet weak var saleVolume: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dismissPopUp(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        sale = tmpSale
        
        saleid.text = String(sale!.sale!.id!)
        productName.text = sale?.productName
        storeName.text = sale?.storeName
        storeLocation.text = sale?.storeLocation
        
        //quantity.text = String(sale!.sale!.quantity!)
        saleVolume.text = String(sale!.sale!.quantity!)
        totalAmount.text = String(sale!.sale!.totalAmount!)
        date.text = sale?.sale?.saleDate?.maxLength(length: 16)
        
        // Do any additional setup after loading the view.
    }
}

