//
//  CreatePINPresenterImpl.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import Foundation
import UIKit

class CreatePINPresenterImpl: CreatePINPresenterProtocol {
   
    
   
    
    
    let view: CreatePINViewController
    let interactor: CreatePINInteractorProtocol
    let router: CreatePINRouterProtocol
    
    init(view: CreatePINViewController, interactor: CreatePINInteractorProtocol, router: CreatePINRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func createPIN(pin: String) {
        self.interactor.postCreatePINData(pin: pin)
    }
    
    func navigateToHome() {
        self.router.navigateToHome()
    }
        
}

extension CreatePINPresenterImpl: CreatePINInteractorOutputProtocol {
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            //jika true akan menampilkan alert
            self.view.showAlert()
        }
        else {
            //jika false akan menampilkan alertfailed
            self.view.showAlertFailed()
        }
    }
    
}
