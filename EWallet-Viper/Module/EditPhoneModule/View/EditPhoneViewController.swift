//
//  EditPhoneViewController.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import UIKit

class EditPhoneViewController: UIViewController {

    @IBOutlet weak var phoneNoTF: UITextField!
    
    var presenter: EditPhonePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.showUserProfile()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBack(_ sender: Any) {
        self.presenter?.showbackToProfile(viewController: self)
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        let phone = phoneNoTF.text ?? ""
        if (phone == ""){
            showAllertFailed()
        } else {
            self.presenter?.editPhone(phone: phone)
            
        }
    }
}

extension EditPhoneViewController: EditPhoneView {
    func showProfile(profile: UserProfileEntity) {
        
    }
    
    func showbackToProfile() {
        self.presenter?.showbackToProfile(viewController: self)
    }
    //

   func showAllert() {
       let alert = UIAlertController(
        title: "Change Phone Number Success",
        message: "you have successfully change phone number",
        preferredStyle: UIAlertController.Style.alert)
       
       alert.addAction(UIAlertAction(
            title: "Back to Home",
            style: UIAlertAction.Style.default,
            handler: {(_: UIAlertAction!) in
                
                self.showbackToProfile()
            }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAllertFailed() {
        let alert = UIAlertController(
         title: "Change Phone Number Failed",
         message: "your request could not be processed, please try again",
         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
             title: "Back to Home",
             style: UIAlertAction.Style.default,
             handler: {(_: UIAlertAction!) in
                 self.showbackToProfile()
             }))
         self.present(alert, animated: true, completion: nil)
     }
}
