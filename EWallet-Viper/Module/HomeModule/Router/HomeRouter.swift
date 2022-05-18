//
//  HomeRouter.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

protocol HomeRouter {
    func navigateToLogin()
    func navigateToHistory(viewController: UIViewController)
    func navigateToTransfer(viewController :UIViewController)
    func navigateToProfile(viewController: UIViewController)
    func navigateToTopUp(viewController :UIViewController)
    func navigateToNotification(viewController : UIViewController)
}
