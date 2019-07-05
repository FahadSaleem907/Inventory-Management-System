import UIKit

class productDetailsViewController: UIViewController {

    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var purchaseDate: UILabel!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
