//
//  BalanceAPI.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import Moya

public enum BalanceApi {
    case getBalance
    case patchProfile(phone: String)
}

extension BalanceApi: TargetType {
    public var baseURL: URL {
        return URL(string: String(describing: "http://54.172.233.0:8000"))!
    }
    
    public var path: String {
        switch self {
        case .getBalance:
            return "/home/getBalance"
        case .patchProfile:
            return "/user/changeInfo"
        }
    }
    
    public var method: Moya.Method {
        switch self {
            case .getBalance:
                return .get
            case .patchProfile:
                return .patch
        }
    }
    
    public var task: Task {
        switch self {
        case .getBalance:
            return .requestPlain
        case .patchProfile(let phone):
            return .requestParameters(parameters: ["phone": phone], encoding: JSONEncoding.default)
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
