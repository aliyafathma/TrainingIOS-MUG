//
//  BalanceNetworkManager.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public protocol BalanceNetworkManager {
    func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ())
    func editPhone(phone: String, completion: @escaping (EditPhoneResponse?, Error?) -> ())
}
