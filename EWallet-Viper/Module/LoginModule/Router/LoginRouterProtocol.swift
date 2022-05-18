//
//  LoginRouterProtocol.swift
//  ZWallet
//
//  Created by user217917 on 4/1/22.
//

import Foundation
import UIKit

protocol LoginRouterProtocol {
    func navigateToHome()
    func navigateToRegister(viewController : UIViewController)
    func navigateToCreatePIN()
}

