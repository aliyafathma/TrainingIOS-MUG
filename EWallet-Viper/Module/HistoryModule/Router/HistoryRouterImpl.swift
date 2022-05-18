//
//  HostoryRouterImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

public class HistoryRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        vc.modalPresentationStyle = .automatic
        
        let networkManager = InvoiceNetworkManagerImpl()
        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(networkManager: networkManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension HistoryRouterImpl: HistoryRouter {
    func dismissPage(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
