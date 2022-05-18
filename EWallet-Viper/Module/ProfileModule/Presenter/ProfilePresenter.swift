//
//  ProfilePresenter.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import Foundation
import UIKit


protocol ProfilePresenter {
    func loadProfile()
    func backToHome(viewController: UIViewController)
    func showChangePassword(viewController: UIViewController)
    func showEditPhone(viewController: UIViewController, profile: UserProfileEntity)
}
