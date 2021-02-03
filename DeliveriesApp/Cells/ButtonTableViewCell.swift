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
    @IBOutlet weak var saveButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        saveButton.layer.cornerRadius = 10
        saveButton.layer.masksToBounds = true
        saveButton.setTitle("Save".localized(), for: .normal)
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
