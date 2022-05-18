//
//  CreatePINInteractorImpl.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import Foundation

class CreatePINInteractorImpl: CreatePINInteractorProtocol {
   
    var interactorOutput: CreatePINInteractorOutputProtocol?
    let createPINNetworkManager: CreatePINNetworkManager
    
    init(networkManager: CreatePINNetworkManager) {
        self.createPINNetworkManager = networkManager
    }
    
    func postCreatePINData(pin: String) {
        //mengirimkan data email dan password ke API
        self.createPINNetworkManager.createPIN(pin: pin) { data, error in
            if let response = data{
                if  response.status == 200 {
                //trigger presenter jika proses berhasil
                    print("Status: \(response.status)")
                self.interactorOutput?.authenticationResult(isSuccess: true)
                }
                else {
                    print("ini error:\(String(describing: error))")
                    //memberitahukan ke presenter jika proses gagal
                    self.interactorOutput?.authenticationResult(isSuccess: false)
                }
            }
        }
    }
}
