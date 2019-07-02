import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var nameTxt: fancyTextField!
    @IBOutlet weak var emailTxt: fancyTextField!
    @IBOutlet weak var pwTxt: fancyTextField!
    
    @IBAction func createUser(_ sender: designableUIButton)
    {
        if nameTxt.text?.isEmpty == true
        {
            alert(msg: "Name Missing. \nEnter Name", controller: self, textField: nameTxt)
        }
        else if emailTxt.text?.isEmpty == true
        {
            alert(msg: "Email Missing. \nEnter Email", controller: self, textField: emailTxt)
        }
        else if pwTxt.text?.isEmpty == true
        {
            alert(msg: "Password Missing. \nEnter Password", controller: self, textField: pwTxt)
        }
    }
    
    @IBAction func cancel(_ sender: designableUIButton)
    {
        self.dismiss(animated: true)
        {
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

extension SignUpViewController
{
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
}
