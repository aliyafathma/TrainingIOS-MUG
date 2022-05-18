//
//  TransferInteractorOutputProtocol.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation


protocol TransferInteractorOutputProtocol{
    func getUserProfile(userProfile : UserProfileEntity)
    func transactionSuccess(isSuccess : Bool)
}
