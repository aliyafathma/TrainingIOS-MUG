//
//  ChangePasswordAPI.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import Moya
public enum ChangePasswordAPI {
    case changePassword(old_password: String, new_password: String)
}

extension ChangePasswordAPI: TargetType {
    public var path: String {
        switch self {
        case .changePassword:
            return "user/changePassword"
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .changePassword(let old_password, let new_password):
            return .requestParameters(
                parameters: [
                    "old_password": old_password,
                    "new_password": new_password
                ],
                encoding: JSONEncoding.default
            )
        }
    }

    public var baseURL: URL {
        return URL(string: String(describing: "http://54.172.233.0:8000"))!
    }

    public var method: Moya.Method {
        return .patch
    }

    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
}
