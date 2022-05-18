//
//  OTPViewController.swift
//  ZWallet
//
//  Created by user217064 on 4/6/22.
//

import UIKit

class OTPViewController: UIViewController {

    //textfield
    @IBOutlet weak var otp1: UITextField!
    @IBOutlet weak var otp2: UITextField!
    @IBOutlet weak var otp3: UITextField!
    @IBOutlet weak var otp4: UITextField!
    @IBOutlet weak var otp5: UITextField!
    @IBOutlet weak var otp6: UITextField!
    
    //button
    @IBOutlet weak var btnConfirmOTP: UIButton!
    
    //presenter
    var presenter: OTPPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.otp1.delegate = self
        self.otp2.delegate = self
        self.otp3.delegate = self
        self.otp4.delegate = self
        self.otp5.delegate = self
        self.otp6.delegate = self
        
        self.otp1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp5.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp6.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        
    }
    
    @objc func changeCharacter(textField: UITextField){
        if textField.text?.utf8.count == 1 {
            switch textField {
            case otp1:
                otp2.becomeFirstResponder()
                otp1.layer.borderWidth = 2
                otp1.layer.cornerRadius = 5
                otp1.layer.borderColor = UIColor.blue.cgColor
            case otp2:
                otp3.becomeFirstResponder()
                otp2.layer.borderWidth = 2
                otp2.layer.cornerRadius = 5
                otp2.layer.borderColor = UIColor.blue.cgColor
            case otp3:
                otp4.becomeFirstResponder()
                otp3.layer.borderWidth = 2
                otp3.layer.cornerRadius = 5
                otp3.layer.borderColor = UIColor.blue.cgColor
            case otp4:
                otp5.becomeFirstResponder()
                otp4.layer.borderWidth = 2
                otp4.layer.cornerRadius = 5
                otp4.layer.borderColor = UIColor.blue.cgColor
            case otp5:
                otp6.becomeFirstResponder()
                otp5.layer.borderWidth = 2
                otp5.layer.cornerRadius = 5
                otp5.layer.borderColor = UIColor.blue.cgColor
           //cek data sudah masuk atau tidak
            case otp6:
                print (
                    (otp1.text!),
                    (otp2.text!),
                    (otp3.text!),
                    (otp4.text!),
                    (otp5.text!),
                    (otp6.text!)
                )
                otp6.layer.borderWidth = 2
                otp6.layer.cornerRadius = 5
                otp6.layer.borderColor = UIColor.blue.cgColor
            default:
                break
            }
        } else if textField.text!.isEmpty{
            switch textField {
            case otp6 :
                otp5.becomeFirstResponder()
                otp6.layer.borderWidth = 2
                otp6.layer.cornerRadius = 5
                otp6.layer.borderColor = UIColor.lightGray.cgColor
            case otp5 :
                otp4.becomeFirstResponder()
                otp5.layer.borderWidth = 2
                otp5.layer.cornerRadius = 5
                otp5.layer.borderColor = UIColor.lightGray.cgColor
            case otp4 :
                otp3.becomeFirstResponder()
                otp4.layer.borderWidth = 2
                otp4.layer.cornerRadius = 5
                otp4.layer.borderColor = UIColor.lightGray.cgColor
            case otp3 :
                otp2.becomeFirstResponder()
                otp3.layer.borderWidth = 2
                otp3.layer.cornerRadius = 5
                otp3.layer.borderColor = UIColor.lightGray.cgColor
            case otp2 :
                otp1.becomeFirstResponder()
                otp2.layer.borderWidth = 2
                otp2.layer.cornerRadius = 5
                otp2.layer.borderColor = UIColor.lightGray.cgColor
            default:
                otp1.layer.borderWidth = 2
                otp1.layer.cornerRadius = 5
                otp1.layer.borderColor = UIColor.lightGray.cgColor
                break
            }
        }
    }
    
    @IBAction func btnConfirmOTP(_ sender: Any) {
        let otpAll : String =   "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
//        print("Button Send OTP Triggered")
        let email = UserDefaultHelper.shared.get(key: .userEmail) ?? ""
        print(email)
        print(otpAll)
        self.presenter?.otpConfirm(email: email, otp: otpAll)
    }
    

}

extension OTPViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty {
            return false
        } else {
            return true
        }
    }
}

extension OTPViewController : OTPViewProtocol {
    func navigateToLogin() {
        self.presenter?.navigateToLogin()
    }
    
    func showAllert() {
        let alert = UIAlertController(
                title: "OTP Validation Success",
                message: "you have successfully activated your account",
                preferredStyle: UIAlertController.Style.alert)
               
               alert.addAction(UIAlertAction(
                    title: "Back to Login",
                    style: UIAlertAction.Style.default,
                    handler: {(_: UIAlertAction!) in
                        self.navigateToLogin()
                    }))
                self.present(alert, animated: true, completion: nil)
    }
    
    func showAllertFailed() {
        let alert = UIAlertController(
                 title: "OTP Validation Failed",
                 message: "your request could not be processed, please contact our administrator to activate your account",
                 preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(
                     title: "Back to Login",
                     style: UIAlertAction.Style.default,
                     handler: {(_: UIAlertAction!) in
                         self.navigateToLogin()
                     }))
                 self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
