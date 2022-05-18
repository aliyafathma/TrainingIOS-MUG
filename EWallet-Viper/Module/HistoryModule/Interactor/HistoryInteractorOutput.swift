//
//  HistoryInteractorOutput.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

protocol HistoryInteractorOutput {
    func loadedHistory(transaction: [TransactionEntity])
}
