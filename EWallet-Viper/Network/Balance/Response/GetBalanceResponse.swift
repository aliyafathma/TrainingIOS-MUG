//
//  GetBalanceResponse.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public struct GetBalanceResponse: Codable {
    public var status: Int
    public var message: String
    public var data: [GetBalanceDataResponse]
}
