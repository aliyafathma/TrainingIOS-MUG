//
//  HomeInteractorOutput.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

protocol HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity)
    func loadedTransaction(transactions: [TransactionEntity])
}
