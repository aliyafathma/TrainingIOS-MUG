//
//  HomePresenterImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

class HomePresenterImpl: HomePresenter {
   
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func showTranfer(viewController: UIViewController) {
        self.router.navigateToTransfer(viewController: viewController)
    }
    func loadProfile() {
        self.interactor.getUserProfile()
    }
    func showNotification(viewController: UIViewController) {
        self.router.navigateToNotification(viewController: viewController)
    }
    
    
    func loadTransaction() {
        self.interactor.getTransaction()
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHistory(viewController: viewController)
    }
    
    func logout() {
        UserDefaultHelper.shared.remove(key: .userToken)
        self.router.navigateToLogin()
    }
    
    func showProfile(viewController: UIViewController) {
        self.router.navigateToProfile(viewController: viewController)
    }
    
    func topUp(viewController: UIViewController) {
        self.router.navigateToTopUp(viewController: viewController)
    }
}

extension HomePresenterImpl: HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showUserProfileData(userProfile: userProfile)
    }
    
    func loadedTransaction(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
    
    
}
