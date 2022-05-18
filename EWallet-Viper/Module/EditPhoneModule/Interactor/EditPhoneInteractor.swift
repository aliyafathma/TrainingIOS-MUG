//
//  EditPhoneInteractor.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation

protocol EditPhoneInteractor {
    func getProfile()
    func updateProfilePhone(profile: UserProfileEntity)
    func postEditPhoneData(phone : String)
}
