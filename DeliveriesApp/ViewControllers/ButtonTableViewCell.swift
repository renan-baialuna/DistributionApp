//
//  ButtonTableViewCell.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 01/02/21.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    var section: Int = 0
    var delegate: saveProtocol? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func saveData() {
        delegate?.startSave(section: section)
    }

}
