import UIKit
import RSLoadingView

class SignInViewController: UIViewController {

    var role:Bool = false
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let userServices = userFunctions()
    let progressView = RSLoadingView()
    
    @IBOutlet weak var emailTxtOut: fancyTextField!
    @IBOutlet weak var pwTxtOut: fancyTextField!
    
    @IBAction func loginBtn(_ sender: UIButton)
    {
        
        if emailTxtOut.text?.isEmpty == true
        {
            alert(msg: "Email missing. Enter Email.", controller: self, textField: emailTxtOut)
        }
        else if pwTxtOut.text?.isEmpty == true
        {
            alert(msg: "Password missing. Enter Password", controller: self, textField: pwTxtOut)
        }
        else
        {
            userServices.token = ""
            progressView.show(on: self.view)
            userServices.login(email: "\(emailTxtOut.text!)", password: "\(pwTxtOut.text!)")
            {
                (success, user , token, error) in
                    if success == true
                    {
                        guard let token = token else { return }
                        guard let user = user else { return }
                        print(user)
                        self.role = user.role!
                        print(user.role!)
                        if self.userServices.token != ""
                        {
                            self.performSegue(withIdentifier: "loginScreen", sender: self)
                            self.progressView.hide()
                        }
                    }
                    else
                    {
                        print(error!.localizedDescription)
                        self.progressView.hide()
                    }
            }
        //progressView.hide()
        }
    }
    
    
    @IBAction func signUp(_ sender: UIButton)
    {
        performSegue(withIdentifier: "userTypeScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "loginScreen"
        {
        let getDashboard = segue.destination as! UINavigationController
        let dashboard = getDashboard.viewControllers.first as! DashboardViewController
        print(role)
        dashboard.tmpRole = role
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        emailTxtOut.text = "test@test.com"
        pwTxtOut.text = "123"
        print(userServices.token + "----------------------------")
        
    }
}

extension SignInViewController
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
    
    
    func alertSegue(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Welcome", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: {_ in self.performSegue(withIdentifier: "loginScreen", sender: self) })
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
}
