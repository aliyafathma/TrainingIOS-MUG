//
//  OTPPresenterImpl.swift
//  ZW
//
//  Created by user217064 on 4/12/22.
//

import Foundation
import UIKit

class OTPPresenterImpl: OTPPresenterProtocol {
    
    let view : OTPViewController
    let interactor : OTPInteractorProtocol
    let router: OTPRouterProtocol
    
    init(view: OTPViewController, interactor: OTPInteractorProtocol, router: OTPRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigateToLogin() {
        self.router.navigateToLogin()
    }
    
    
    func otpConfirm(email: String, otp: String) {
        self.interactor.postOtpData(email: email, otp: otp)
    }
}

extension OTPPresenterImpl: OTPInteractorOutputProtocol{
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            self.view.showAllert()
        }
        else {
            self.view.showAllertFailed()
        }
    }
}
