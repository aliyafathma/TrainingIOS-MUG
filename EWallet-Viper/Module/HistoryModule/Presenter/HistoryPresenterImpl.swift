//
//  HistoryPresenterImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

class HistoryPresenterImpl: HistoryPresenter {

    let view: HistoryView
    let interactor: HistoryInteractor
    let router: HistoryRouter

    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func loadHistory() {
        self.interactor.getHistory()
    }

    func dismiss(viewController: UIViewController) {
        self.router.dismissPage(viewController: viewController)
    }
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedHistory(transaction: [TransactionEntity]) {
        self.view.showTransaction(transaction: transaction)
    }
}
