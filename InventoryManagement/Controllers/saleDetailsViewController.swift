import UIKit

class saleDetailsViewController: UIViewController
{

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var saleVolume: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
