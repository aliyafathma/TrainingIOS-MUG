//
//  RegisterInteractorImpl.swift
//  ZWallet
//
//  Created by user217917 on 4/5/22.
//

import Foundation

class RegisterInteractorImpl: RegisterInteractorProtocol {
    
    var interactorOutput: RegisterInteractorOutputProtocol?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postRegisterData(username: String, email: String, password: String) {
        //mengirimkan data email dan password ke API
        self.authNetworkManager.register(username: username, email: email, password: password) { data, error in
            if data != nil {
                UserDefaultHelper.shared.set(key: .userEmail, value:email)

                self.interactorOutput?.authenticationResult(isSuccess: true)
            }
            else {
                print("ini error\(String(describing: error))")
                //memberitahukan ke presenter jika proses gagal
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
}

