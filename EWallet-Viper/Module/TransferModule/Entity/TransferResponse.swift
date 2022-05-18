//
//  TransferResponse.swift
//  ZW
//
//  Created by user217064 on 4/8/22.
//

import Foundation

public struct TransferResponse: Codable {
    public var status: Int
    public var message: String
    public var details: TransferDataResponse
}

public struct TransferDataResponse: Codable {
    public var sender, receiver, amount: Int
    public var notes: String
    public var type: Int
    public var created_at: String
}



