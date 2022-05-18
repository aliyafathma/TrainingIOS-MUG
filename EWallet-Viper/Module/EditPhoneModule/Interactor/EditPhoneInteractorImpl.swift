//
//  EditPhoneInteractorImpl.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation
import UIKit

class EditPhoneInteractorImpl: EditPhoneInteractor {
    
    var user: UserProfileEntity
    var interactorOutput: EditPhoneInteractorOutput?
    
    var networkManager: BalanceNetworkManager
    
    init(user: UserProfileEntity, networkManager: BalanceNetworkManager) {
        self.user = user
        self.networkManager = networkManager
    }
    
    func getProfile() {
        self.interactorOutput?.loadedUserProfileData(userProfile: user)
    }
    
    func updateProfilePhone(profile: UserProfileEntity) {
        
    }
    
    func postEditPhoneData(phone: String) {
        self.networkManager.editPhone(phone: phone) { data, error in
            if let data = data {
                if data.status == 200 {
                    self.interactorOutput?.theSuccess(isSuccess: true)
                }
                else {
                    self.interactorOutput?.theSuccess(isSuccess: false)
                    
                }
            }
        }
    }
}
