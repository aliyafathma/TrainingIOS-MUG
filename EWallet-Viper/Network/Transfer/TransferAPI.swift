//
//  TransferAPI.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/7/22.
//

import Foundation
import Moya
public enum TransferAPI {
    case transfer(receiver: String, amount: String, notes: String)
}

extension TransferAPI: TargetType {
    public var path: String {
        switch self {
        case .transfer:
            return "tranfer/newTranfer"
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .transfer(let receiver, let amount, let notes):
            return .requestParameters(
                parameters: ["receiver": receiver, "amount": amount, "notes": notes
                            ],
                encoding: JSONEncoding.default
            )
        }
    }

    public var baseURL: URL {
        return URL(string: String(describing: "http://54.172.233.0:8000"))!
    }

    public var method: Moya.Method {
        return .post
    }

    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "x-access-PIN" : "123456",
            "Authorization": "Bearer \(token)"
        ]
    }
}
