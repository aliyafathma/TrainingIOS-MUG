//
//  TransactionCell.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import UIKit
import Kingfisher

class TransactionCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func showData(transaction: TransactionEntity) {
        self.nameLabel.text = transaction.name
        self.noteLabel.text = transaction.notes

        if transaction.type == "in" {
            self.amountLabel.text = "+\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 0.1176470588, green: 0.7568627451, blue: 0.3725490196, alpha: 1)
        } else {
            self.amountLabel.text = "-\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 1, green: 0.3568627451, blue: 0.2156862745, alpha: 1)
        }

        let url = URL(string: transaction.imageUrl)
        self.userImage.kf.setImage(with: url)
    }
}
