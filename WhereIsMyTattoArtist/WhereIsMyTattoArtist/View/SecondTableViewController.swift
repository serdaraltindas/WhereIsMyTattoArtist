//
//  SecondTableViewController.swift
//  WhereIsMyTattoArtist
//
//  Created by Serdar Altındaş on 30.04.2023.
//

import UIKit

class SecondTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        
    }
    
    @objc func addbuttonPressed(){
        performSegue(withIdentifier: "toUploadVC", sender: self)
    }
    
    @objc func backPressed() {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SecondCustomTableViewCell
        cell.kullaniciAdiLabel.text = "Test"
        cell.customImageView.image = UIImage(named: "background2")
        cell.commentLabel.text = "Test"
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

}
