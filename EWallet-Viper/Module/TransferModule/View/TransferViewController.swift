//
//  TransferViewController.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import UIKit

class TransferViewController: UIViewController {
    
    //MARK: LABEL
    @IBOutlet weak var userPhoneNumber: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    //MARK: TEXTFIELD
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var notes: UITextField!
    
    //MARK: DECLARE
    var profile : UserProfileEntity?
    var presenter : TransferPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = "Aftabuddin Arsyad"
        userPhoneNumber.text = "+08123456789"
    }

    @IBAction func TransferAction(_ sender: Any) {
        let receiver = "1043"
        let amount = amount.text ?? ""
        let notes = notes.text ?? ""
        self.presenter?.transfer(receiver: receiver, amount: amount, notes: notes )
    }
}


extension TransferViewController : TransferView{
    func navigatetoHome() {
        self.presenter?.navigatetoHome()
    }
    

   func showAllert() {
       let alert = UIAlertController(
        title: "Transfer Success",
        message: "you have successfully transferred to Aftabudin Arsyad",
        preferredStyle: UIAlertController.Style.alert)
       
       alert.addAction(UIAlertAction(
            title: "Back to Home",
            style: UIAlertAction.Style.default,
            handler: {(_: UIAlertAction!) in
                
                self.navigatetoHome()
            }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAllertFailed() {
        let alert = UIAlertController(
         title: "Transfer Failed",
         message: "Transfer request could not be processed, please try again",
         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
             title: "Back to Home",
             style: UIAlertAction.Style.default,
             handler: {(_: UIAlertAction!) in
                 self.navigatetoHome()
             }))
         self.present(alert, animated: true, completion: nil)
     }
    
    
    func getUser(userProfileEntity: UserProfileEntity) {
        userName.text = "Aftabuddin Arsyad"
    }
    
}
