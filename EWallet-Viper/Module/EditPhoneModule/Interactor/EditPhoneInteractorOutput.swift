//
//  EditPhoneInteractorOutput.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation

protocol EditPhoneInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity)
    func theSuccess(isSuccess : Bool)
}
