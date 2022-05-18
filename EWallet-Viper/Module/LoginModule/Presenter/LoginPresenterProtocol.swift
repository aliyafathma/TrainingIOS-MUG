//
//  LoginPresenter.swift
//  ZWallet
//
//  Created by user217917 on 3/31/22.
//

import Foundation
import UIKit


protocol LoginPresenterProtocol {
    func login(email: String, password: String)
    func signUpOnClick(viewController : UIViewController)
}
