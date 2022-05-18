//
//  DetailsTransaction.swift
//  ZW
//
//  Created by user217336 on 4/12/22.
//

import Foundation
public struct DetailsTransaction: Codable {
    var status: Int
    var message: String
    var data: DetailsTransactionData
}

public struct DetailsTransactionData: Codable {
    let id, senderID: Int
    let sender, senderPhone, senderImage: String
    let receiverID: Int
    let receiver, receiverPhone, receiverImage: String
    let amount: Int
    let notes, type, createdAt: String

  
}
