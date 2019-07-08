import UIKit

class productDetailsViewController: UIViewController {

    var tmpProduct:Product?
    var product:Product?
    
    @IBOutlet weak var name: UILabel!
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
        product = tmpProduct
        
        name.text = product?.name
        manufacturer.text = product?.manufacture
        price.text = String(product!.amount!)
        quantity.text = String(product!.quantity!)
        purchaseDate.text = product?.date?.maxLength(length: 16)
        
        super.viewDidLoad()
    }
}
