//
//  EditPhoneView.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation

protocol EditPhoneView {
    func showProfile(profile: UserProfileEntity)
    func showbackToProfile()
    func showAllert()
    func showAllertFailed()
}
