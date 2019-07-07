import UIKit

class AddProductController: UIViewController
{
    var datePicker = UIDatePicker()
    let productServices = productFunctions()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBOutlet weak var productName: fancyTextField!
    @IBOutlet weak var productManufacturer: fancyTextField!
    @IBOutlet weak var productDescription: fancyTextField!
    @IBOutlet weak var productAmount: fancyTextField!
    @IBOutlet weak var productQuantity: fancyTextField!
    @IBOutlet weak var dateTxt: fancyTextField!
    
    @IBOutlet weak var saveBtnOutlet: designableUIButton!
    
    @IBAction func saveBtnAction(_ sender: designableUIButton)
    {
        if productName.text?.isEmpty == true
        {
            alert(msg: "Name missing.\nEnter Name.", controller: self, textField: productName)
        }
        else if productManufacturer.text?.isEmpty == true
        {
            alert(msg: "Manufacturer missing.\nEnter Manufacturer.", controller: self, textField: productManufacturer)
        }
        else if productDescription.text?.isEmpty == true
        {
            alert(msg: "Description missing.\nEnter Description.", controller: self, textField: productDescription)
        }
        else if productAmount.text?.isEmpty == true
        {
            alert(msg: "Amount Missing.\nEnter Amount.", controller: self, textField: productAmount)
        }
        else if productQuantity.text?.isEmpty == true
        {
            alert(msg: "Quantity missing.\nEnter Quantity.", controller: self, textField: productQuantity)
        }
        else if dateTxt.text?.isEmpty == true
        {
            alert(msg: "Date missing.\nEnter Date.", controller: self, textField: dateTxt)
        }
        else
        {
            let product1 = Product(productname: productName.text!, productmanufacturer: productManufacturer.text!, productdescription: productDescription.text!, productamount: Int(productAmount.text!)!, productquantity: Int(productQuantity.text!)!, productdate: dateTxt.text!)

            print(product1)
            
            productServices.addProduct(token: self.delegate.mainToken!, product: product1)
            {
                (error) in
                if error == nil
                {
                    self.successAlert(msg: "Store Create Successfully", controller: self)
                }
                else
                {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func cancelBtnAction(_ sender: designableUIButton)
    {
        
    }
    
    @IBAction func backbtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
        
        showDatePicker()
        createPickerViewToolbar()
    }
    
}

extension AddProductController
{
    private func showDatePicker()
    {
        datePicker.datePickerMode = .date
        dateTxt.inputView = datePicker
    }
    
    @objc private func dateSelected()
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        //dateFormat.dateFormat = "E, dd MM yyyy HH:MM:SS Z"
        dateFormat.timeZone = TimeZone(secondsFromGMT: 0)!
        dateTxt.text = dateFormat.string(from: datePicker.date)
        print(dateTxt.text!)
        self.view.endEditing(true)
    }
    
    func createPickerViewToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dateSelected))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        dateTxt.inputAccessoryView = toolBar
    }
    
    @objc func donePressed()
    {
        view.endEditing(true)
    }
    
    
    
    func alert(msg:String , controller:UIViewController, textField:UITextField)
    {
        
        let alertValidation = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default)
        {
            (_) in textField.becomeFirstResponder()
        }
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
        
    }
    
    func successAlert(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true) })
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
}
