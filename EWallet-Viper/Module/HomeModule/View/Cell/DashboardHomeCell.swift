//
//  DashboardHomeCell.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import UIKit

class DashboardHomeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var bell: UIImageView!
    var delegate: DashboardCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func showData(userProfile: UserProfileEntity) {
        self.nameLabel.text = userProfile.name
        self.balanceLabel.text = userProfile.balance.formatToIdr()
        self.phoneNumberLabel.text = userProfile.phoneNumber
        
        let url = URL(string: userProfile.imageUrl)
        self.profileImage.kf.setImage(with: url)
    }
    
    @IBAction func showTransactionAction(_ sender: Any) {
        self.delegate?.showAllTransaction()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.delegate?.logout()
    }
    
    
    @IBAction func TransferAction(_ sender: Any) {
        self.delegate?.showTransfer()
    }
    
    
    @IBAction func TopUpAction(_ sender: Any) {
        self.delegate?.topUp()
    }
    

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
            self.delegate?.showToProfile()
        }

    @IBAction func notification(_ sender: Any) {
        self.delegate?.showNotification()
    }

}
