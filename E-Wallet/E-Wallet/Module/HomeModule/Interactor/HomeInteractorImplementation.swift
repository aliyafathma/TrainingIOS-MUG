//
//  HomeInteractorImplementation.swift
//  E-Wallet
//
//  Created by Aliya Fathma Najihati on 19/05/22.
//

import Foundation

public class HomeInteractorImplementation: HomeInteractorProtocol {
    let balanceNetWorkManager: BalanceNetworkManagerProtocol
    let invoiceNetworkManager: BalanceNetworkManagerProtocol
    
    var interactorOutput: HomeInteractorToPresenterProtocol?
    
    init(balanceNetWorkManager: BalanceNetworkManagerProtocol, invoiceNetworkManager: BalanceNetworkManagerProtocol) {
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
