//
//  ChangePasswordImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation


class ChangePasswordInteractorImpl : ChangePasswordInteractorProtocol {
    
    
    var interactorOutput: ChangePasswordInteractorOutputProtocol?
    let changePasswordNetworkManager: ChangePasswordNetworkManager
    
    init(changePasswordNetworkManager : ChangePasswordNetworkManager){
        self.changePasswordNetworkManager = changePasswordNetworkManager
    }
    
    func postChangePasswordData(old_passsword: String, new_password: String) {
        self.changePasswordNetworkManager.changePassword(old_password: old_passsword, new_password: new_password) { data, error in
                if let data = data {
                    if data.status == 200 {
                        //trigger presenter jika proses berhasil
                        print("Status: \(data.status)")
                        self.interactorOutput?.transactionSuccess(isSuccess: true)
                    }
                    else {
                        //memberitahukan ke presenter jika proses gagal
                        print("Status: \(data.status)")
                        self.interactorOutput?.transactionSuccess(isSuccess: false)
                        
                    }
                }
        }
    }
}
