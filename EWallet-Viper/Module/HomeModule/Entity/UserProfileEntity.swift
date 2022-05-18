//
//  UserProfileEntity.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public struct UserProfileEntity {
    var name: String
    var balance: Int
    var phoneNumber: String
    var imageUrl: String
    
    public init(name: String, balance: Int, phoneNumber: String, imageUrl: String) {
            self.name = name
            self.balance = balance
            self.phoneNumber = phoneNumber
            self.imageUrl = imageUrl
        }
}
