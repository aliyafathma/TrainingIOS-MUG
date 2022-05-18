//
//  InvoiceEntity.swift
//  ZW
//
//  Created by user217336 on 4/11/22.
//

import Foundation

public struct InvoiceResponse: Codable {
    public var date : String
    public var data :  [InvoiceDataResponse]
}


public struct InvoiceDataResponse: Codable {
    let id, sender, receiver: Int
    let name, phone, image, type: String
    let amount: Int
    let notes, createdAt: String
}
