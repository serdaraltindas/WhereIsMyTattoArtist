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

        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SecondCustomTableViewCell
        cell.kullaniciAdiLabel.text = "Test"
        cell.customImageView.image = UIImage(named: "background3")
        cell.commentLabel.text = "Test"
        return cell
    }
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      //  return 500
    //}
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tatto İstanbul"
    }

  
}
