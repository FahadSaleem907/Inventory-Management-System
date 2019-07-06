import UIKit

class AddProductController: UIViewController
{
    var datePicker = UIDatePicker()
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
}
