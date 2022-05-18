//
//  GetBalanceDataResponse.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public struct GetBalanceDataResponse: Codable {
    public var id: Int
    public var name: String
    public var phone: String
    public var balance: Int
    public var image: String
}
