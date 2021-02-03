//
//  MenuItemTableViewCell.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 31/01/21.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textEntry: UITextField!
    var row: Int = 0
    var delegate: changeField?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textEntry.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MenuItemTableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.changeTextField(row: row, text: textEntry.text)
    }

}
