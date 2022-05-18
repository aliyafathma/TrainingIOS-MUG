//
//  AppRouter.swift
//  ZWallet
//
//  Created by user217917 on 4/1/22.
//

import Foundation
import UIKit

public class AppRouter {

    public static let shared: AppRouter = AppRouter()

    public var loginScene: (() -> ())? = nil

    public func navigateToLogin() {
        self.loginScene?()
    }

    public var homeScene: (() -> ())? = nil

    public func navigateToHome() {
        self.homeScene?()
    }

    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil

    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
    
    public var profileScene: ((_ viewController: UIViewController) -> ())?
       
       public func navigateToProfile(_ viewController: UIViewController) {
           self.profileScene?(viewController)
       }
       
       public var editPhoneScene: ((_ viewController: UIViewController, _ profile: UserProfileEntity) -> ())?
       
       public func navigateToEditPhone(_ viewController: UIViewController, _ profile: UserProfileEntity) {
           self.editPhoneScene?(viewController, profile)
       }
}
