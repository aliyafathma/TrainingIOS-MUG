//
//  CreatePINNetworkManager.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import Foundation


public protocol CreatePINNetworkManager {
    func createPIN(
        pin: String,
        completion: @escaping (CreatePINResponse?, Error?) -> ())
}
