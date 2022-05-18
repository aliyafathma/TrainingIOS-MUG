//
//  HomeInteractorImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
class HomeInteractorImpl: HomeInteractor {
    let balanceNetWorkManager: BalanceNetworkManager
    let invoiceNetworkManager: InvoiceNetworkManager
    
    var interactorOutput: HomeInteractorOutput?
    
    init(balanceNetWorkManager: BalanceNetworkManager, invoiceNetworkManager: InvoiceNetworkManager) {
        self.balanceNetWorkManager = balanceNetWorkManager
        self.invoiceNetworkManager = invoiceNetworkManager
    }
    
    func getUserProfile() {
        self.balanceNetWorkManager.getBalance { (data, error) in
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: "\(AppConstant.baseUrl)\(balance.image)")
                self.interactorOutput?
                    .loadedUserProfileData(userProfile: userProfile)
            }
        }
    }
    
    func getTransaction() {
        self.invoiceNetworkManager.getThisWeekInvoice { data, error in
            var transactions: [TransactionEntity] = []
            
            data?.forEach({ invoiceData in
                transactions.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                self.interactorOutput?.loadedTransaction(transactions: transactions)
            })
        }
    }
}
