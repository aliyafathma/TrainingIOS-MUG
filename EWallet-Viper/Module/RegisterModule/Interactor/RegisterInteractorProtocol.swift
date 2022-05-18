//
//  RegisterInteractorProtocol.swift
//  ZWallet
//
//  Created by user217917 on 4/5/22.
//

import Foundation

protocol RegisterInteractorProtocol {
    func postRegisterData(username: String, email: String, password: String)
}
