//
//  OTPPresenterProtocol.swift
//  ZWallet
//
//  Created by user217064 on 4/6/22.
//

import Foundation

protocol OTPPresenterProtocol{
    func navigateToLogin()
    func otpConfirm(email: String, otp: String)
}
