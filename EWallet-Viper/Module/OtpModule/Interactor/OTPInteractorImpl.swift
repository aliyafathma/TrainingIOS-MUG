//
//  OTPInteractorImpl.swift
//  ZW
//
//  Created by user217064 on 4/12/22.
//

import Foundation

class OTPInteractorImpl : OTPInteractorProtocol {
    
    var interactorOutput: OTPInteractorOutputProtocol?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postOtpData(email: String, otp: String) {
        //mengirimkan data email dan kode OTP ke API
        self.authNetworkManager.otp(email: email, otp: otp) { data, error in
            if let data = data {
                if data.status == 200 {
                    self.interactorOutput?.authenticationResult(isSuccess: true)
                }
                else {
                    self.interactorOutput?.authenticationResult(isSuccess: false)
                }
            }
            else {
                print("something wrong while connecting to server")
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
}
