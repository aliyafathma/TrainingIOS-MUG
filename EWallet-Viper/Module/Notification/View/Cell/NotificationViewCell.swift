//
//  NotificationViewCell.swift
//  ZW
//
//  Created by user217336 on 4/12/22.
//

import UIKit

class NotificationViewCell: UITableViewCell {
    var invoice : [InvoiceResponse] = []

    @IBOutlet weak var imageTransfer: UIImageView!
    
    @IBOutlet weak var transfer: UILabel!
    @IBOutlet weak var balance: UILabel!
    var delegate : NotificationDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    func showData(invoice : InvoiceResponse,invoiceData : InvoiceDataResponse, detail : DetailsTransactionData?){

        if(invoiceData.type == "out"){
            self.transfer.text = "transfered to \(detail?.receiver) "
            self.balance.text = invoiceData.amount.formatToIdr()
            
          }else if(invoiceData.type == "in"){
            self.transfer.text = "transfered from \(detail?.sender) "
            self.balance.text = invoiceData.amount.formatToIdr()
        }
    }
    
    
}
