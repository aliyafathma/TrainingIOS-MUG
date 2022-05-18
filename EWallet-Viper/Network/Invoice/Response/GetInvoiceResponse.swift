//
//  getInvoiceResponse.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public struct GetInvoiceResponse: Codable {
    var status: Int
    var message: String
    var data: [GetInvoiceDataResponse]
}
