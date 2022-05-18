//
//  ChangePasswordViewController.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    //PRESENTER
    var presenter: ChangePasswordPresenterProtocol?
    
    //TEXTFIELD
    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    //BUTTON
    @IBOutlet weak var btnChangePassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnChangePassword(_ sender: Any) {
        let old_password = currentPassword.text ?? ""
        let new_password = newPassword.text ?? ""
        let confirm_password = repeatPassword.text ?? ""
        
        if (newPassword.text != repeatPassword.text) {
            self.presenter?.navigatetoHome()
        }
        else {
            self.presenter?.changePassword(old_password: old_password, new_password: new_password)
        }
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.navigatetoHome()
    }
    
    
}

extension ChangePasswordViewController : ChangePasswordViewProtocol{
    func navigatetoHome() {
        self.presenter?.navigatetoHome()
    }

   func showAllert() {
       let alert = UIAlertController(
        title: "Change Password Success",
        message: "you have successfully change password",
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
         title: "Change Password Failed",
         message: "your request could not be processed, please try again",
         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
             title: "Back to Home",
             style: UIAlertAction.Style.default,
             handler: {(_: UIAlertAction!) in
                 self.navigatetoHome()
             }))
         self.present(alert, animated: true, completion: nil)
     }
    
    
}
