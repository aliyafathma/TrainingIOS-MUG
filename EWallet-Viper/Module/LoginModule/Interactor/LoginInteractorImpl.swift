//
//  LoginInteractorImpl.swift
//  ZWallet
//
//  Created by user217917 on 3/31/22.
//

import Foundation

class LoginInteractorImpl: LoginInteractorProtocol {
    
    
    
    var interactorOutput: LoginInteractorOutputProtocol?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        //mengirimkan data email dan password ke API
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data {
                //menyimpan token
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.token)
                //get data hasPin
                UserDefaultHelper.shared.set(key: .userHasPin, value: loginData.hasPin)
                //trigger presenter jika proses berhasil
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
