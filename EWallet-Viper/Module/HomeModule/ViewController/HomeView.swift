//
//  HomeView.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

protocol HomeView {
    func showUserProfileData(userProfile: UserProfileEntity)
    func showTransactionData(transactions: [TransactionEntity])
}
