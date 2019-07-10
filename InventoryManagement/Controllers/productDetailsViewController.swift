import UIKit

class productDetailsViewController: UIViewController {

    var tmpProduct:Product?
    var product:Product?
    var editChecker:Bool = false
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var manufacturer: fancyTextField!
    @IBOutlet weak var price: fancyTextField!
    @IBOutlet weak var quantity: fancyTextField!
    @IBOutlet weak var purchaseDate: fancyTextField!
    
    @IBOutlet weak var sellBtn: designableUIButton!
    @IBOutlet weak var editBtn: designableUIButton!
    
    @IBAction func sellProduct(_ sender: designableUIButton)
    {
        if sellBtn.currentTitle == "Sell"
        {
            performSegue(withIdentifier: "showSaleScreen", sender: self)
        }
        else
        {
            return
        }
    }
    
    @IBAction func editProduct(_ sender: designableUIButton)
    {
        editChecker = !editChecker
        
        if editChecker == false
        {
            editModeOff()
            sellBtn.setTitle("Sell", for: .normal)
            editBtn.setTitle("Edit", for: .normal)
        }
        else
        {
            editModeOn()
            sellBtn.setTitle("Update", for: .normal)
            editBtn.setTitle("Cancel", for: .normal)
        }
    }
    
    
    @IBAction func dismissPopUp(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToSale = segue.destination as! AddSalesController
        goToSale.tmpProduct = product
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        editModeOff()
    }
    
    override func viewDidLoad()
    {
        product = tmpProduct
        
        name.text = product?.name
        manufacturer.text = product?.manufacture
        price.text = String(product!.amount!)
        quantity.text = String(product!.quantity!)
        purchaseDate.text = product?.date?.maxLength(length: 16)

        editModeOff()
        super.viewDidLoad()
    }
}

extension productDetailsViewController
{
    func editModeOn()
    {
        manufacturer.isUserInteractionEnabled = true
        price.isUserInteractionEnabled = true
        quantity.isUserInteractionEnabled = true
        purchaseDate.isUserInteractionEnabled = true
    }

    func editModeOff()
    {
        manufacturer.isUserInteractionEnabled = false
        manufacturer.backgroundColor = .clear
        price.isUserInteractionEnabled = false
        price.backgroundColor = .clear
        quantity.isUserInteractionEnabled = false
        quantity.backgroundColor = .clear
        purchaseDate.isUserInteractionEnabled = false
        purchaseDate.backgroundColor = .clear
    }
}
