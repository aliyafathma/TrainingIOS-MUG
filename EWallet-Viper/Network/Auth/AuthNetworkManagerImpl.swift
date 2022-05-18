//
//  AuthNetworkManagerImpl.swift
//  ZWallet
//
//  Created by user217917 on 3/31/22.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager {
    public init() {
        
    }
    
    public func register(username: String, email: String, password: String, completion: @escaping (RegisterResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.register(username : username, email: email, password: password)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let registerResponse = try decoder.decode(RegisterResponse.self, from: result.data)
                    completion(registerResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    

    public func login(email: String, password: String, completion: @escaping (LoginDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.login(email: email, password: password)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: result.data)
                    completion(loginResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    public func otp(email: String, otp: String, completion: @escaping (OTPDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.otp(email: email, otp: otp)) { result in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let otpRegister = try decoder.decode(OTPDataResponse.self, from: res.data)
                    completion(otpRegister, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let err):
                    completion(nil, err)
            }
        }
    }
    
    
    
}
