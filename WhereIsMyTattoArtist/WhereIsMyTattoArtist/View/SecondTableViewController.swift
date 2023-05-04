

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage

class SecondTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var emailDizisi = [String]()
    var yorumDizisi = [String]()
    var gorselDizisi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        //
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed))
        navigationItem.leftBarButtonItem = backButton
        //
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addbuttonPressed))
        navigationItem.rightBarButtonItem = addButton
        //
        tableView.layer.opacity = 0.95
        
        firebaseVerileriAl()
    }
    func firebaseVerileriAl() {
        let firestoreDatabase = Firestore.firestore()
        //descanding -> yeni atılan en üstte
        firestoreDatabase.collection("Posted").order(by: "tarih", descending: true)
            .addSnapshotListener { (snapshot, error) in
                if error != nil {
                    self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                }else{
                    if snapshot?.isEmpty != true && snapshot != nil {
                        
                        self.emailDizisi.removeAll(keepingCapacity: false)
                        self.gorselDizisi.removeAll(keepingCapacity: false)
                        self.yorumDizisi.removeAll(keepingCapacity: false)
                        
                        for document in snapshot!.documents {
                            //let documentId = document.documentID
                            
                            if let gorselUrl = document.get("gorselurl") as? String {
                                self.gorselDizisi.append(gorselUrl)
                            }
                            if let yorum = document.get("yorum") as? String {
                                self.yorumDizisi.append(yorum)
                            }
                            if let email = document.get("email") as? String {
                                self.emailDizisi.append(email)
                            }
                        }
                        self.tableView.reloadData()
                    }
                }
            }
    }
    @objc func addbuttonPressed(){
        performSegue(withIdentifier: "toUploadVC", sender: self)
    }
    
    @objc func backPressed() {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SecondCustomTableViewCell
        cell.kullaniciAdiLabel.text = emailDizisi[indexPath.row]
        cell.customImageView.sd_setImage(with: URL(string: self.gorselDizisi[indexPath.row]))
        cell.commentLabel.text = yorumDizisi[indexPath.row]
        cell.customImageView.layer.cornerRadius = cell.customImageView.frame.size.width / 2
        cell.customImageView.layer.masksToBounds = true
        cell.customImageView.clipsToBounds = true
        cell.customImageView.layer.borderWidth = 5
        cell.customImageView.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tatto İstanbul"
    }
    func hataMesajı(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
}
