//
//  EditPhonePresenter.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation
import UIKit

protocol EditPhonePresenter {
    func showUserProfile()
    func showbackToProfile(viewController: UIViewController)
    func editPhone(phone: String)
}
