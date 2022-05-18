//
//  HistoryInteractorImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

class HistoryInteractorImpl: HistoryInteractor {

    var interactorOutput: HistoryInteractorOutput?

    let invoiceNetworkManager: InvoiceNetworkManager

    init(networkManager: InvoiceNetworkManager) {
        self.invoiceNetworkManager = networkManager
    }

    func getHistory() {
        self.invoiceNetworkManager.getAllInvoice { (data, error) in
            var transactions: [TransactionEntity] = []

            data?.forEach({ (invoiceData) in
                transactions.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))

                self.interactorOutput?.loadedHistory(transaction: transactions)
            })
        }
    }
}
