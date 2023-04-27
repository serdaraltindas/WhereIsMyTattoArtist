//
//  ViewController.swift
//  WhereIsMyTattoArtist
//
//  Created by Serdar Altındaş on 27.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func girisYapButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toLogInVC", sender: self)
    }
    
    @IBAction func kayıtOlButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUpVC", sender: self)
    }
    
}

