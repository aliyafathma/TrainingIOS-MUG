//
//  HeaderCell.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(title: String) {
        self.titleLabel.text = title
    }
    
}
