//
//  ChangePasswordNetworkManager.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation

public protocol ChangePasswordNetworkManager{
    func changePassword(
        old_password: String,
        new_password : String,
        completion: @escaping (ChangePasswordResponse?, Error?) -> ()
    )
}
