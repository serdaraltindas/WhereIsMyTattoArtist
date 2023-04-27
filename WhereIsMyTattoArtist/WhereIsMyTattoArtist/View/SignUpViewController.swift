//
//  SignUpViewController.swift
//  WhereIsMyTattoArtist
//
//  Created by Serdar Altındaş on 27.04.2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //label animation
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "Where Is My Tatto Artist"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex , repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
    }

}
