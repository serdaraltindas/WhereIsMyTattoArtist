//
//  UploadViewController.swift
//  WhereIsMyTattoArtist
//
//  Created by Serdar Altındaş on 1.05.2023.
//

import UIKit

class UploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed))
        navigationItem.leftBarButtonItem = backButton
    }
        @objc func backPressed() {
          self.dismiss(animated: true)
    }

}
