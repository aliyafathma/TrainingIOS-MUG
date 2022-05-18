//
//  ProfileRouter.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import Foundation
import UIKit

protocol ProfileRouter {
    func navigateToHome(viewController: UIViewController)
    func navigateToChangePasssword(viewController: UIViewController)
    func navigateToEditProfile(viewController: UIViewController, profile: UserProfileEntity)
}
