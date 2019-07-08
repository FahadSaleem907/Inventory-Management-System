import UIKit

class AddSalesController: UIViewController
{

    var datePicker = UIDatePicker()
    var selectedStore:Store?
    var selectedProduct:Product?
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let saleServices = salesFunctions()
    let storeService = storeFunctions()
    let productService = productFunctions()
    
    
    @IBOutlet weak var productID: fancyTextField!
    @IBOutlet weak var storeID: fancyTextField!
    @IBOutlet weak var quantitySold: fancyTextField!
    @IBOutlet weak var stockSold: fancyTextField!
    @IBOutlet weak var dateTxt: fancyTextField!
    @IBOutlet weak var saveBtnOutlet: designableUIButton!
    
    @IBAction func saveBtnAction(_ sender: designableUIButton)
    {
        if productID.text?.isEmpty == true
        {
            alert(msg: "Product ID Missing. \nEnter Product ID.", controller: self, textField: productID)
        }
        else if storeID.text?.isEmpty == true
        {
            alert(msg: "Sale ID Missing. \nEnter Sale ID.", controller: self, textField: storeID)
        }
        else if quantitySold.text?.isEmpty == true
        {
            alert(msg: "Quantity Sold Missing. \nEnter Quantity Sold.", controller: self, textField: quantitySold)
        }
        else if stockSold.text?.isEmpty == true
        {
            alert(msg: "Stock Sold Missing. \nEnter Stock Sold.", controller: self, textField: stockSold)
        }
        else if dateTxt.text?.isEmpty == true
        {
            alert(msg: "Date Missing. \nEnter Date.", controller: self, textField: dateTxt)
        }
        else
        {
            //getSelectedProductAndStore()
            
            //Completely Filling Up The Sales Details Using Data from Products and Stores.
            let sale1 = Sale( pid: Int(productID.text!)!, quantity: Int(quantitySold.text!)!, saledate: dateTxt.text!, stocksold: Int(stockSold.text!)!, storeid: Int(storeID.text!)!)
            
            let completeSale1 = CompleteSale(productname: self.selectedProduct!.name!, sale: sale1, storelocation: self.selectedStore!.location, storename: self.selectedStore!.storeName)
            //let completeSale1 = CompleteSale(sale: sale1)
            print(sale1)
            print(completeSale1)
            saleServices.addSales(token: self.delegate.mainToken! , sale: completeSale1)
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
    
    @IBAction func cancelBtn(_ sender: designableUIButton)
    {
        
    }
    
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
//    func getSelectedProductAndStore()
//    {
//        do
//        {
//            try getSelectedProduct()
//        }
//        catch
//        {
//            print("Failed to get Product Data")
//        }
//
//        do
//        {
//            try getSelectedStore()
//        }
//        catch
//        {
//            print("Failed to get Store Data")
//        }
//    }
    
//    func getSelectedProduct()
//    {
//        //Getting Selected Product Details Using Product ID.
//        productService.getOneProduct(token: delegate.mainToken!, productID: Int(productID.text!)!)
//        {
//            (success, selectedProduct, error) in
//            if success == true {
//            self.selectedProduct = selectedProduct
//            print("======================")
//            print(self.selectedProduct!)
//            print("======================")
//            }
//            else
//            {
//                print(error?.localizedDescription)
//            }
//        }
//    }

//    func getSelectedStore()
//    {
//        //Getting Selected Store Details Using Store ID.
//        storeService.getOneStores(token: delegate.mainToken!, storeID: Int(storeID.text!)!)
//        {
//            (success, selectedStore, error) in
//            if success == true {
//            self.selectedStore = selectedStore
//            print("======================")
//            print(self.selectedStore!)
//            print("======================")
//            }
//            else
//            {
//                print(error?.localizedDescription)
//            }
//        }
//    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
        
        showDatePicker()
        createPickerViewToolbar()
    }

}


extension AddSalesController
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

