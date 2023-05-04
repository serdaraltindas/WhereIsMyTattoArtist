import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Back button color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //label animation
        // titleLabel.text = ""
        //var charIndex = 0.0
        //let titleText = "Where Is My Tatto Artist"
        //for letter in titleText {
        // Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex , repeats: false) { (timer) in
        //    self.titleLabel.text?.append(letter)
        //  }
        //  charIndex += 1
        //}
        //label rectangle
        // let myView = DrawRectangle(frame: CGRect(x: 5, y: 665, width: 385, height: 150))
        //myView.backgroundColor = .clear
        //self.view.addSubview(myView)
    }
    //label rectangle
    //  class DrawRectangle: UIView {
    //  override init(frame: CGRect) {
    //      super.init(frame: frame)
    //  }
    //  required public init?(coder aDecoder: NSCoder) {
    //      super.init(coder: aDecoder)
    //  }
    //  override func draw(_ rect: CGRect) {
    //    guard let context = UIGraphicsGetCurrentContext() else {
    //         print("could not get graphics context")
    //         return
    //     }
    //    context.setStrokeColor(UIColor.white.cgColor)
    //     context.setLineWidth(5)
    //     context.stroke(rect.insetBy(dx: 10, dy: 10))
    // }
    //}
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdataresult, error) in
                if error != nil {
                    self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                }else{
                    self.performSegue(withIdentifier: "signUpToTableView", sender: self)
                }
            }
        } else {
            //error!
            hataMesajı(title: "Hata!", message: "Email veya parola hatalı, tekrar deneyiniz!")
        }
    }
    //alert message
    func hataMesajı(title : String , message : String){
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)
    }
    
}
