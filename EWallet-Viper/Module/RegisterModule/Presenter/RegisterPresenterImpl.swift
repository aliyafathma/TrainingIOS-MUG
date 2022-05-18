//
//  RegisterPresenterImpl.swift
//  ZWallet
//
//  Created by user217917 on 4/5/22.
//

import Foundation
import UIKit

class RegisterPresenterImpl: RegisterPresenterProtocol {
   
    let view: RegisterViewProtocol
    let interactor: RegisterInteractorProtocol
    let router: RegisterRouterProtocol
    
    init(view: RegisterViewProtocol, interactor: RegisterInteractorProtocol, router: RegisterRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func register(username: String, email: String, password: String) {
        self.interactor.postRegisterData(username: username, email: email, password: password)
    }
    
    
    

}

extension RegisterPresenterImpl: RegisterInteractorOutputProtocol {
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            print("Navigasi Sukses")
            self.router.navigateToOtp()
        }
        else {
            self.view.showError()
        }
    }
    
}

