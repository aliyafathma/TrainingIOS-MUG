//
//  AuthApi.swift
//  ZWallet
//
//  Created by user217917 on 3/31/22.
//

import Foundation
import Moya


public enum AuthApi {
    case login(email: String, password: String)
    case register(username: String, email: String, password: String)
    case otp(email: String, otp: String)
}

extension AuthApi: TargetType {
    
    public var baseURL: URL {
        return URL(string: String(describing: "http://54.172.233.0:8000"))!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .register:
            return "/auth/signup"
        case .otp(email: let email, otp: let otp):
            return "auth/activate/\(email)/\(otp)"
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .register(let username, let email, let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password": password], encoding: JSONEncoding.default)
        case .otp(email: let email, otp: let otp):
            return .requestPlain
        }
    }

    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .otp:
            return .get
        }
        
    }

    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
