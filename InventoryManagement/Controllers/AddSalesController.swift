import UIKit

class AddSalesController: UIViewController
{

    var datePicker = UIDatePicker()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var productID: fancyTextField!
    @IBOutlet weak var saleID: fancyTextField!
    @IBOutlet weak var quantitySold: fancyTextField!
    @IBOutlet weak var stockSold: fancyTextField!
    @IBOutlet weak var dateTxt: fancyTextField!
    @IBOutlet weak var saveBtnOutlet: designableUIButton!
    
    @IBAction func saveBtnAction(_ sender: designableUIButton)
    {
        
    }
    
    @IBAction func cancelBtn(_ sender: designableUIButton)
    {
        
    }
    
    
    @IBAction func backBtn(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Inventory Management System"
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
}
