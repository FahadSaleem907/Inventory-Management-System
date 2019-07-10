import UIKit

class AddSalesController: UIViewController
{
    var datePicker = UIDatePicker()
    var storeList = UIPickerView()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let saleServices = salesFunctions()
    let storeService = storeFunctions()
    let productService = productFunctions()
    var finalStoreData = [Store]()
    var tmpProduct:Product?
    var product:Product?
    var store:Store?
    
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
            let sale1 = Sale( pid: Int(productID.text!)!, quantity: Int(quantitySold.text!)!, saledate: dateTxt.text!, stocksold: Int(stockSold.text!)!, storeid: Int(storeID.text!)!)
            
            let completeSale1 = CompleteSale(productname: product!.name!, sale: sale1, storelocation: self.store!.location, storename: self.store!.storeName)

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
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    func getStoreData()
    {
        storeService.getStores(token: self.delegate.mainToken!)
        {
            (success , storeList , error) in
            guard let storeList = storeList else { return }
            print("++++++++++++++ \(storeList) ++++++++++++++")
            self.finalStoreData = storeList as! [Store]
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
        
        storeID.inputView = storeList
        storeList.delegate = self
        storeID.delegate = self
        
        product = tmpProduct
        
        productID.text = String(product!.pid!)
        getStoreData()
        showDatePicker()
        createDateViewToolbar()
        createStoreToolbar()
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
    
    @objc private func storeSelected()
    {
        print(dateTxt.text!)
        self.view.endEditing(true)
    }
    
    
    func createDateViewToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dateSelected))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        
        dateTxt.inputAccessoryView = toolBar
    }
    
    func createStoreToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(storeSelected))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        
        storeID.inputAccessoryView = toolBar
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


extension AddSalesController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return finalStoreData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return finalStoreData[row].storeName + "  ,  " + finalStoreData[row].location
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        storeID.text = String(finalStoreData[row].id!)
        store = finalStoreData[row]
        print("zzzzz\(store)zzzz")
    }
//
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label:UILabel
        
        if let view = view as? UILabel
        {
            label = view
        }
        else
        {
            label = UILabel()
        }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 20)

        label.text = finalStoreData[row].storeName + "  ,  " + finalStoreData[row].location
        
        return label
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == storeID
        {
            return false
        }
        else if textField == dateTxt
        {
            return false
        }
        else
        {
            return true
        }
    }

}
