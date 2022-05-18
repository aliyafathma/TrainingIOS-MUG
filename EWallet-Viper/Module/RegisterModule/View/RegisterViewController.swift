//
//  RegisterViewController.swift
//  ZWallet
//
//  Created by user217917 on 3/30/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //PENDAFTARAN OUTLET
    //TEXTFIELD
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    //ICON
    @IBOutlet weak var iconPerson: UIImageView!
    @IBOutlet weak var iconEmail: UIImageView!
   
    
    
    //UNDERLINE
    
    @IBOutlet weak var lineUsername: UIView!
    @IBOutlet weak var lineEmail: UIView!
    @IBOutlet weak var linePassword: UIView!
    
    //ERROR
    @IBOutlet weak var errorMessage: UILabel!
    
    //BUTTON
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var iconPassword: UIImageView!
    //PRESENTER
    var presenter: RegisterPresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inputEmail.delegate = self
        inputPassword.delegate = self
        inputUsername.delegate = self
        errorMessage.text = ""
        self.inputPassword.isSecureTextEntry = true
    }
    
    
    @IBAction func btnSignUpOnClick(_ sender: Any) {
        let email: String = inputEmail.text ?? ""
        let password: String = inputPassword.text ?? ""
        let username : String = inputUsername.text ?? ""
        self.presenter?.register(username: username,email: email, password: password)
        }
}


extension RegisterViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == inputEmail {
            iconEmail.image = UIImage(systemName: "envelope.fill")
            lineEmail.backgroundColor = .tintColor
        }
        else if textField == inputPassword {
            iconPassword.image = UIImage(systemName: "lock.fill")
            linePassword.backgroundColor = .tintColor
        }
        else if textField == inputUsername {
            iconPerson.image = UIImage(systemName: "person.fill")
            lineUsername.backgroundColor = .tintColor
        }
        btnSignUp.backgroundColor = .tintColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == inputEmail {
            if textField.text == "" {
                iconEmail.image = UIImage(systemName: "envelope")
                lineEmail.backgroundColor = .gray
            }
            else if(textField.text!.count < 5) {
                lineEmail.backgroundColor = .red
            }
        }
        else if textField == inputPassword {
            if textField.text == "" {
                iconPassword.image = UIImage(systemName: "lock")
                linePassword.backgroundColor = .gray
            }
            else if (textField.text!.count < 5) {
                linePassword.backgroundColor = .red
            }
        }
        else if textField == inputUsername {
            if textField.text == "" {
                iconPerson.image = UIImage(systemName: "person")
                lineUsername.backgroundColor = .gray
            }
            else if (textField.text!.count < 5) {
                lineUsername.backgroundColor = .red
            }
        }
        
    }
}


extension RegisterViewController : RegisterViewProtocol{
    func showError() {
            iconEmail.image = UIImage(systemName: "envelope")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            lineEmail.backgroundColor = .red
            iconPassword.image = UIImage(systemName: "lock")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            linePassword.backgroundColor = .red
            errorMessage.text = "Register gagal"
            errorMessage.textColor = .red
        
    }
    
   
    
    
}
