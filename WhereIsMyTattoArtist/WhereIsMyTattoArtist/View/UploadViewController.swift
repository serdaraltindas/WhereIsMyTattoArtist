
import UIKit
import Firebase
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Close Keyboard.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        //Back Button
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed))
        navigationItem.leftBarButtonItem = backButton
        //Çıkış Yap
        let cikisYapButton = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cikisYapPressed))
        navigationItem.rightBarButtonItem = cikisYapButton
        //ImageView
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    
    @objc func cikisYapPressed(){
        
        do {
            try Auth.auth().signOut()
        }catch {
            print("Hata!")
        }
        performSegue(withIdentifier: "toMainVC", sender: self)
    }
    
    @objc func backPressed() {
        self.dismiss(animated: true)
    }
    @objc func klavyeyiKapat(){
        //aksiyonları kapat.
        view.endEditing(true)
    }
    @objc func gorselSec(){
        //kütüphane git-> pickerController
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        //galeri-> göster
        present(picker, animated: true)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //medya seçimi bitti.
        imageView.image = info[.originalImage] as? UIImage
        //açılan galeriyi kapat.
        uploadButton.isEnabled = true
        self.dismiss(animated: true)
    }
    
    @IBAction func uploadButtonClicked(_ sender: UIButton) {
        
    }
}

