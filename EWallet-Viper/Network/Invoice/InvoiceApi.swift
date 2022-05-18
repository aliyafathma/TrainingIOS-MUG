//
//  InvoiceApi.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import Moya

public enum InvoiceApi {
    case getThisWeekInvoice
    case getTodayInvoice
    case getThisMonthInvoice
    case getAllInvoice
    case getTransferDetails(id : Int)
}

extension InvoiceApi: TargetType {
    public var path: String {
        switch self {
        case .getThisWeekInvoice, .getAllInvoice,.getThisMonthInvoice,.getTodayInvoice:
            return "/home/getAllInvoice"
      
        
        case .getTransferDetails(let id):
            return "/tranfer/details/\(id)"
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .getThisWeekInvoice:
            return .requestParameters(parameters: ["thisweek": true], encoding: URLEncoding.queryString)
        case .getAllInvoice:
            return .requestPlain
        case .getTodayInvoice:
            return .requestParameters(parameters: ["today": true], encoding: URLEncoding.queryString)
        case .getThisMonthInvoice:
            return .requestParameters(parameters: ["thismonth": true], encoding: URLEncoding.queryString)
        case .getTransferDetails(id : let id):
            return .requestPlain
            
        }
    }

    public var baseURL: URL {
        return URL(string: String(describing: "http://54.172.233.0:8000"))!
    }

    public var method: Moya.Method {
        return .get
    }

    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
}
