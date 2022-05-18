//
//  ProfileInteractorImpl.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import Foundation

class ProfileInteractorImpl: ProfileInteractor {
    var networkManager: BalanceNetworkManager
    var interactorOutput: ProfileInteractorOutput?
    
    init(networkManager: BalanceNetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProfile() {
        self.networkManager.getBalance { (data, error) in
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: balance.image)
                self.interactorOutput?.loadedUserProfileData(userProfile: userProfile)
            }
        }
    }
}
