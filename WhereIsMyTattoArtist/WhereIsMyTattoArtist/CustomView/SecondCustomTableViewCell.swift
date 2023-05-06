//
//  SecondCustomTableViewCell.swift
//  WhereIsMyTattoArtist
//
//  Created by Serdar Altındaş on 30.04.2023.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var secondCustomImageView: UIImageView!
    @IBOutlet weak var kullaniciAdiLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
