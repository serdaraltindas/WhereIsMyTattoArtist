import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Back button color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //label animation
        //titleLabel.text = ""
        //var charIndex = 0.0
        //let titleText = "Where Is My Tatto Artist"
        // for letter in titleText {
        //Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex , repeats: false) { (timer) in
        //      self.titleLabel.text?.append(letter)
        //}
        //  charIndex += 1
        // }
        //label rectangle
        //let myView = DrawRectangle(frame: CGRect(x: 5, y: 665, width: 385, height: 150))
        //myView.backgroundColor = .clear
        // self.view.addSubview(myView)
        
    }
    //label rectangle
    //class DrawRectangle: UIView {
    //override init(frame: CGRect) {
    //super.init(frame: frame)
    // }
    //required public init?(coder aDecoder: NSCoder) {
    // super.init(coder: aDecoder)
    //}
    // override func draw(_ rect: CGRect) {
    // guard let context = UIGraphicsGetCurrentContext() else {
    //     print("could not get graphics context")
    //         return
    //      }
    //      context.setStrokeColor(UIColor.white.cgColor)
    //      context.setLineWidth(5)
    //       context.stroke(rect.insetBy(dx: 10, dy: 10))
    //   }
    // }
    
    @IBAction func logInButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "logInToTableView", sender: self)
        
    }
    
}
