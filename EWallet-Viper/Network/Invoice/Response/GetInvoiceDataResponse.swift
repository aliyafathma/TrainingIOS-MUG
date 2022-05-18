//
//  GetInvoiceDataResponse.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public struct GetInvoiceDataResponse: Codable {
    public var id: Int
    public var sender: Int
    public var receiver: Int
    public var name: String
    public var phone: String
    public var image: String
    public var type: String
    public var amount: Int
    public var notes: String
}
