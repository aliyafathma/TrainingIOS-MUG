//
//  ChangePasswordPresenterImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import UIKit

class ChangePasswordPresenterImpl : ChangePasswordPresenterProtocol {
    
    let view: ChangePasswordViewController
    let interactor: ChangePasswordInteractorProtocol
    let router: ChangePasswordRouterProtocol


    init(view : ChangePasswordViewController, interactor : ChangePasswordInteractorProtocol, router : ChangePasswordRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigatetoHome() {
        self.router.navigatetoHome()
    }
    
    func changePassword(old_password: String, new_password: String) {
        self.interactor.postChangePasswordData(old_passsword: old_password, new_password: new_password)
    }
    
}

extension ChangePasswordPresenterImpl : ChangePasswordInteractorOutputProtocol{
    func transactionSuccess(isSuccess: Bool) {
        if isSuccess {
            self.view.showAllert()
            print("sukses")
        }else{
            self.view.showAllertFailed()
            print("gagal")
        }
    }
}


