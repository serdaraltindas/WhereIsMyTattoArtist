
import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

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
        imageView.image = info[.editedImage] as? UIImage
        //açılan galeriyi kapat.
        uploadButton.isEnabled = true
        self.dismiss(animated: true)
    }
    
    @IBAction func uploadButtonClicked(_ sender: UIButton) {
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("Media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5 ) {
            
            let uuid = UUID().uuidString
            
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data) { (StorageMetadata , error) in
                if error != nil {
                    //hata mesajı
                    self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                }else{
                    imageReferance.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            if let imageUrl = imageUrl {
                                
                                let firestoreDatabase = Firestore.firestore()
                                let firestorePost = ["gorselurl" : imageUrl , "yorum" : self.commentTextField.text! , "email" : Auth.auth().currentUser?.email as Any, "tarih" : FieldValue.serverTimestamp()] as [String : Any]
                                firestoreDatabase.collection("Posted").addDocument(data: firestorePost) {
                                    (error) in
                                    if error != nil {
                                        self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                                    }else{
                                        self.imageView.image = UIImage()
                                        self.commentTextField.text = ""
                                        self.performSegue(withIdentifier: "toSecondVC"  , sender: self)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func hataMesajı(title : String , message : String){
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)
    }
}

