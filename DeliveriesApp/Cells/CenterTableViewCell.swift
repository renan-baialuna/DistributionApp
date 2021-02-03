//
//  CenterTableViewCell.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 02/02/21.
//

import UIKit

class CenterTableViewCell: UITableViewCell {
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var ocupationLabel: UILabel!
    @IBOutlet weak var ocupationBar: UIProgressView!
    @IBOutlet weak var mainView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
