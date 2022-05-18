//
//  TransferNetworkManager.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/7/22.
//

import Foundation

public protocol TransferNetworkManager{
    func transfer(
        receiver: String,
        amount : String,
        notes: String,
        completion: @escaping (TransferDataResponse?, Error?) -> ()
    )
}
