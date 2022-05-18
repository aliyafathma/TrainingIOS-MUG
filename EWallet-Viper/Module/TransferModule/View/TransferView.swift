//
//  TransferView.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation

protocol TransferView{
    func getUser(userProfileEntity : UserProfileEntity)
    func showAllert()
    func showAllertFailed()
    func navigatetoHome()
}
