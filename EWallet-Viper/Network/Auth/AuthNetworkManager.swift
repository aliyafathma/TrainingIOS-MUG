//
//  AuthNetworkManager.swift
//  ZWallet
//
//  Created by user217917 on 3/31/22.
//

import Foundation

public protocol AuthNetworkManager {
    func login(
        email: String,
        password: String,
        completion: @escaping (LoginDataResponse?, Error?) -> ())
    
    func register(
        username: String,
        email: String,
        password: String,
        completion: @escaping (RegisterResponse?, Error?) -> ())
    
    func otp(
        email: String,
        otp: String,
        completion: @escaping (OTPDataResponse?, Error?) -> ())
}
