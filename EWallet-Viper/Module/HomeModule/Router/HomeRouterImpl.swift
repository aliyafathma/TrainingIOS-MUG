//
//  HomeRouterImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

public class HomeRouterImpl {
    
    public static func navigateToModule() {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let invoiceNetworkManager = InvoiceNetworkManagerImpl()
        
        let router = HomeRouterImpl()
        let interactor = HomeInteractorImpl(balanceNetWorkManager: balanceNetworkManager, invoiceNetworkManager: invoiceNetworkManager)
        let presenter = HomePresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}


extension HomeRouterImpl: HomeRouter {
    func navigateToNotification(viewController: UIViewController) {
        NotificationRouterImpl.NavigateToModule(viewController : viewController)
    }
    
    func navigateToTransfer(viewController : UIViewController) {
        TransferRouterImpl.navigateToModule(viewController : viewController)
        
    }
    

    func navigateToHistory(viewController: UIViewController) {
        HistoryRouterImpl.navigateToModule(viewController: viewController)
    }

    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    func navigateToProfile(viewController: UIViewController) {
            AppRouter.shared.navigateToProfile(viewController)
        }

    func navigateToTopUp(viewController: UIViewController) {
        TopUpRouterImpl.navigateToModule(viewController: viewController)
    }

}
