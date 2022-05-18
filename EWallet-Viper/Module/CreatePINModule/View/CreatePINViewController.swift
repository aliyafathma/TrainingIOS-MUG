//
//  CreatePINViewController.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import UIKit

class CreatePINViewController: UIViewController {

    //MARK: pin-textfield
    @IBOutlet weak var pin1: UITextField!
    @IBOutlet weak var pin2: UITextField!
    @IBOutlet weak var pin3: UITextField!
    @IBOutlet weak var pin4: UITextField!
    @IBOutlet weak var pin5: UITextField!
    @IBOutlet weak var pin6: UITextField!
    
    
    var presenter: CreatePINPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pin1.delegate = self
        self.pin2.delegate = self
        self.pin3.delegate = self
        self.pin4.delegate = self
        self.pin5.delegate = self
        self.pin6.delegate = self
        
        self.pin1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.pin2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.pin3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.pin4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.pin5.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.pin6.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        
    }
    @objc func changeCharacter(textField : UITextField){
           if textField.text?.utf8.count == 1 {
               switch textField {
               case pin1:
                   pin2.becomeFirstResponder()
                   pin1.layer.borderWidth = 2
                   pin1.layer.cornerRadius = 5
                   pin1.layer.borderColor = UIColor.blue.cgColor
               case pin2:
                   pin3.becomeFirstResponder()
                   pin2.layer.borderWidth = 2
                   pin2.layer.cornerRadius = 5
                   pin2.layer.borderColor = UIColor.blue.cgColor
               case pin3:
                   pin4.becomeFirstResponder()
                   pin3.layer.borderWidth = 2
                   pin3.layer.cornerRadius = 5
                   pin3.layer.borderColor = UIColor.blue.cgColor
               case pin4:
                   pin5.becomeFirstResponder()
                   pin4.layer.borderWidth = 2
                   pin4.layer.cornerRadius = 5
                   pin4.layer.borderColor = UIColor.blue.cgColor
               case pin5:
                   pin6.becomeFirstResponder()
                   pin5.layer.borderWidth = 2
                   pin5.layer.cornerRadius = 5
                   pin5.layer.borderColor = UIColor.blue.cgColor
                   
               default:
                   pin6.layer.borderWidth = 2
                   pin6.layer.cornerRadius = 5
                   pin6.layer.borderColor = UIColor.blue.cgColor
                   print(pin1.text!, pin2.text!, pin3.text!, pin4.text!, pin5.text!, pin6.text!)
                   break
               }
           }else if textField.text!.isEmpty {
               switch textField {
               case pin6:
                   pin5.becomeFirstResponder()
                   pin6.layer.borderWidth = 2
                   pin6.layer.borderColor = UIColor.lightGray.cgColor
               case pin5:
                   pin4.becomeFirstResponder()
                   pin5.layer.borderWidth = 2
                   pin5.layer.borderColor = UIColor.lightGray.cgColor
               case pin4:
                   pin3.becomeFirstResponder()
                   pin4.layer.borderWidth = 2
                   pin4.layer.borderColor = UIColor.lightGray.cgColor
               case pin3:
                   pin2.becomeFirstResponder()
                   pin3.layer.borderWidth = 2
                   pin3.layer.borderColor = UIColor.lightGray.cgColor
               case pin2:
                   pin2.layer.borderWidth = 2
                   pin2.layer.borderColor = UIColor.lightGray.cgColor
                   pin1.becomeFirstResponder()
            
                   
            
               default:
                   pin1.layer.borderWidth = 2
                   pin1.layer.borderColor = UIColor.lightGray.cgColor
                   break
               }
           }
       }
    
    @IBAction func btnCreatePIN(_ sender: Any) {
        let pinAll : String =   "\(pin1.text!)\(pin2.text!)\(pin3.text!)\(pin4.text!)\(pin5.text!)\(pin6.text!)"
     //  let pin: String = pinAll.text ?? ""
    
        self.presenter?.createPIN(pin: pinAll)
    }
    
   
}

extension CreatePINViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty{
            return false
        } else {
            return true
        }
    }
}

extension CreatePINViewController: CreatePINViewProtocol{
   

    func navigateToHome() {
        self.presenter?.navigateToHome()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Create PIN Success", message: "Your PIN has been successfully set",         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
             title: "Go to Home",
             style: UIAlertAction.Style.default,
             handler: {(_: UIAlertAction!) in
                 
                 self.navigateToHome()
             }))
         self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertFailed() {
        let alert = UIAlertController(
         title: "Create PIN Failed",
         message: "Your request could not be processed, please try again at next login ",
         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
             title: "Back to Home",
             style: UIAlertAction.Style.default,
             handler: {(_: UIAlertAction!) in
                 self.navigateToHome()
             }))
         self.present(alert, animated: true, completion: nil)
     }
    
    
}
