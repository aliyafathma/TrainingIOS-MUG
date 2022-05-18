//
//  ChangePasswordPresenterProtocol.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import UIKit

protocol ChangePasswordPresenterProtocol {
    func navigatetoHome()
    func changePassword(old_password: String, new_password: String)
}
