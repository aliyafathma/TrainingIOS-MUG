//
//  CreatePINApi.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import Foundation
import Moya

public enum CreatePINApi{
    case createPIN (pin: String)
}

extension CreatePINApi: TargetType{
    public var baseURL: URL {
        return URL(string: String(describing: "http://54.172.233.0:8000"))!
    }
    
    public var path: String {
        switch self {
        case .createPIN:
            return "/auth/PIN"
        }
    }
    
    public var method: Moya.Method {
        return .patch
    }
    
    public var task: Task {
        switch self {
        case .createPIN(let pin):
            return .requestParameters(
                parameters: ["PIN": pin],
                encoding: JSONEncoding.default
            )
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    

}

